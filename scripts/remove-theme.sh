#!/bin/bash

#? Usage
if [ -z "$1" ]; then
    echo "Usage: $0 <theme-name>"
    exit 1
fi

#? Remove the theme submodule
git submodule deinit -f themes/$1
git rm -rf --cached themes/$1
rm -rf .git/modules/themes/$1
rm -rf themes/$1

#? Remove the theme from the hugo.toml file
sed -i '' "/theme = '$1'/d" hugo.toml
