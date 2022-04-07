[ Metacello new
    baseline: 'Roassal3';
    repository: 'github://ObjectProfile/Roassal3';
    load: 'Full' ] on: MCMergeOrLoadWarning do: [:warning | warning load ].

[ Metacello new
    baseline: 'Roassal3Exporters';
    repository: 'github://ObjectProfile/Roassal3Exporters';
    load ] on: MCMergeOrLoadWarning do: [:warning | warning load ].

[ Metacello new
    baseline: 'StringClassifier';
    repository: 'github://jborden23/StringClassifier:main';
    load ] on: MCMergeOrLoadWarning do: [:warning | warning load ].


packageName := 'StringClassifier'.
uml := RSUMLClassBuilder new.
uml classes: (RPackageOrganizer default packageNamed: packageName) definedClasses.
uml build.

uml canvas extent: 1000 @ 1000.
RSPNGExporter new
  canvas: uml canvas;
  exportToFile: 'uml.png' asFileReference.

SmalltalkImage current quitPrimitive
