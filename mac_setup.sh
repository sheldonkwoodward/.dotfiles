#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade
brew install bat diff-so-fancy htop micro node pipenv prettyping python2 python3 trash tree vim

# link python3
