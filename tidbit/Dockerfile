FROM ubuntu-voyage

RUN \
	./pharo Pharo.image eval --save "\
		Metacello new \
			githubUser: 'yannij' project: 'Tidbit' commitish: 'master' path: 'src'; \
			baseline: 'Tidbit'; \
			onConflictUseLoaded; \
			onWarningLog; \
			load"

RUN \
	./pharo Pharo.image eval --save "\
		WAAdmin disableDevelopmentTools. \
		WADispatcher default handlers keys do:[:name | WAAdmin unregister:name]. \
		WAEnvironment registerDefaultRequestHandlers. \
		WADispatcherBrowser initialize. \
		MCWBasicLayoutApp registerToDeployment: MCWBasicLayoutApp applicationPath. \
		MCWDemoCatalogApp registerToDeployment: MCWDemoCatalogApp applicationPath. \
		MCWExampleApplication registerToDeployment: MCWExampleApplication applicationPath. \
		MCWShrineApp registerToDeployment: MCWShrineApp applicationPath. \
		ZnZincServerAdaptor startOn: 8080"

CMD ["./pharo", "Pharo.image", "--no-quit"]
