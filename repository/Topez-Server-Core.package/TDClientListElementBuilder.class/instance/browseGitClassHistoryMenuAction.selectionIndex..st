menu actions
browseGitClassHistoryMenuAction: listElement selectionIndex: selectionIndex
  | itemAttribute classDef configDef gitTool filePath commitish gitDirectory registration gitRepo packageDef packageName classExtension metaDirName methodFilename commitLog mcTool wc |
  itemAttribute := listElement itemCache at: selectionIndex.
  classDef := itemAttribute object.
  configDef := classDef configurationOf.
  configDef ifNil: [ ^ false ].
  registration := configDef projectRegistrationDef.
  registration ifNil: [ ^ false ].
  registration hasGitRepository
    ifFalse: [ ^ false ].
  packageDef := classDef packageOf.
  packageName := packageDef packageName.
  mcTool := listElement topez toolInstanceFor: 'mc'.
  gitTool := listElement topez toolInstanceFor: 'git'.
  gitRepo := registration repository.
  wc := mcTool resolveWorkingCopyReference: packageName.
  classExtension := '.class'.
  filePath := 'repository/' , (wc metacelloPackageNameWithBranch at: 2)
    , '.package' , '/' , classDef className asString , classExtension.
  gitDirectory := registration gitRootDirectory.
  commitLog := gitTool
    gitlogFilePath: filePath
    limit: 100
    gitRepoDirectory: gitDirectory.
  commitish := registration versionString.
  (TDGitRawHistoryBrowser new
    topez: listElement topez;
    source: commitish;
    destination: commitish;
    rawCommitLog: commitLog gitRepoDirectory: gitDirectory;
    logItemSelectedBlock: [ :listEl :rawHistoryBrowser :sha | 
          | operation |
          rawHistoryBrowser
            sourceWindowId:
              ((listEl topez toolInstanceFor: 'git')
                gitfiletreeChangestool: sha
                filePath: filePath
                gitRepoDirectory: gitDirectory
                windowId: rawHistoryBrowser sourceWindowId
                windowLabel: 'Changes for [' , sha , '] ' , classDef label) ];
    windowLabel: 'History for ' , classDef label;
    yourself) open.
  ^ true