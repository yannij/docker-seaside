Metacello new 
	repository: 'github://yannij/Tidbit/src';
	baseline: 'Tidbit';
	onConflictUseLoaded;
	load.

#WAAdmin asClass clearAll.
#WAAdmin asClass defaultDispatcher defaultName: 'browse'.
#WADispatcherBrowser asClass initialize.
#WAEnvironment asClass registerDefaultRequestHandlers.
(#MCWApplication asClass allSubclasses select: [ :eachClass | eachClass class methodDictionary includesKey: #applicationPath])
	do: [ :eachRoot | eachRoot initialize ].
