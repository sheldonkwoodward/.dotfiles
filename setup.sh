#!/bin/bash

# get home directory
CD="$(pwd)"

# hard link files
ln -F $CD/.bash_profile $HOME/.bash_profile
ln -F $CD/.gitignore_global $HOME/.gitignore_global
ln -F $CD/.gitconfig $HOME/.gitconfig

# set better git cli colors
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# check for Mac or Linux
if [[ $(uname) == Darwin ]];
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update && brew upgrade
  brew install bat diff-so-fancy fd fzf git htop micro ncdu node pipenv prettyping python2 python3 trash tree vim
  # link python3
else
  echo "Linux"
fi
