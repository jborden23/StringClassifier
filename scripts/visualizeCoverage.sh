#!/usr/bin/env bash
# curl -L https://get.pharo.org/64 | bash
wget -O- https://get.pharo.org | bash
./pharo --headless Pharo.image ./scripts/visualizeCoverage.st
