#! /bin/bash -x
mkdir -p build
cd build
#curl https://get.pharo.org/64/ | bash

cp -p Pharo.image tidbit.image
cp -p Pharo.changes tidbit.changes

cat > load-tidbit.st <<EOS
Metacello new
    githubUser: 'yannij' project: 'Tidbit' commitish: 'master' path: 'src';
    baseline: 'Tidbit';
    onConflictUseLoaded;
    onWarningLog;
    load: #('default')
EOS

cat > configure.st <<EOS
"Disable developer toolbar"
WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance.

"Unregister all Seaside applications"
WADispatcher default handlers keys do:[:name | WAAdmin unregister:name].

"Register Seaside applications to be deployed"
MCWBasicLayoutApp initialize.
MCWDemoCatalogApp initialize.
MCWExampleApplication initialize.
MCWShrineApp initialize.

"Start Seaside server on port 8080"
ZnZincServerAdaptor startOn: 8080.
EOS

./pharo -vm-display-null -vm-sound-null tidbit.image eval --save load-tidbit.st
./pharo -vm-display-null -vm-sound-null tidbit.image eval --save configure.st
