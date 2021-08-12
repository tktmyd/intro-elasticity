#!/bin/bash

jb build src
rsync -av --delete src/_build/html/ ./docs/ --exclude docs/.nojekyll

