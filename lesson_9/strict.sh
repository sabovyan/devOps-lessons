#!/bin/bash


# -e - exit whenever any command has none zero exit
# -u - cause a program to immediatedly exit if a variable doesn't exists excepts $@ and $*
# -o pipefail -  prevents errors in a pipeline
# IFC - prevents string spliting
# for more information checkout out this article - http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFC=$'\n\t'

echo "strict mode"
