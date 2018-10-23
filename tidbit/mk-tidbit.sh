#! /bin/bash -x
mkdir -f build
cd build
cp -p ../Pharo.image tidbit.image
cp -p ../Pharo.changes tidbit.changes
./pharo tidbit.image eval --save "
Metacello new
    githubUser: 'yannij' project: 'Tidbit' commitish: 'master' path: 'src';
    baseline: 'Tidbit';
    onConflictUseIncoming;
    onWarningLog;
    load.
"
./pharo tidbit.image eval --save "ZnZincServerAdaptor startOn: 8080"