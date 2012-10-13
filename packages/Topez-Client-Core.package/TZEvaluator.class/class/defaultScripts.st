command definition
defaultScripts
    "TZGsEvaluator initialize.
	TZNativeEvaluator initialize"

    scripts
        at: 'topez'
            put:
                (Dictionary new
                        at: 'filterClasses'
                            put:
                                '(self editorModelNamed: #topezClasses) listEditor
  listFilter: [:element | element inExtensionClassList]';
                        at: 'testing' put: '3+4';
                        yourself);
        at: 'run'
            put:
                (Dictionary new
                        at: 'init'
                            put:
                                'TZGsEvaluator initialize.
TZNativeEvaluator initialize.
TZObject initialize.
TZProxyObject initialize.
TZTopez initialize.
TZEvaluator debugMode: true.';
                        at: 'testing' put: '3+4';
                        yourself);
        at: 'input'
            put:
                (Dictionary new
                        at: 'topezFilter'
                            put:
                                'set project Topez
edit #topezClasses prclasses
topez filterClasses';
                        at: 'topez'
                            put:
                                'set project Topez
set class TZEvaluator
edit  prclasses
edit superclasses
edit subclasses';
                        at: 'testing'
                            put:
                                'run
3+4
%';
                        yourself);
        yourself