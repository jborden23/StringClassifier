#!/usr/bin/bash
curl -L https://get.pharo.org/64/ | bash
./pharo --headless Pharo.image ./scripts/visualizeClassDiagram.st
