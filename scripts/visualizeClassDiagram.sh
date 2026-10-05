#!/usr/bin/bash
# curl -L https://get.pharo.org/64/ | bash
wget -O- https://get.pharo.org/90+vm | bash
./pharo --headless Pharo.image ./scripts/visualizeClassDiagram.st
