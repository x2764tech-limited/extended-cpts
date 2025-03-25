#!/usr/bin/env bash

composer="docker run --rm -it -v $PWD:/app -v ${COMPOSER_HOME:-$HOME/.composer} composer/composer"

#composer=composer

$composer update

VERSION=$(${composer} show -f json johnbillion/extended-cpts --no-cache | jq -r '.versions[0]')

if [[ -z `git tag -l "${VERSION}"` ]]
then
  #update Version tag in php
  sed -i -e "s/Version:.\+$/Version: ${VERSION}/" extended-cpts.php
  git commit -a -m "chore: Update extended-cpts to ${VERSION}"
  git tag "${VERSION}"
  git push --tags origin


  zip -r -ll "extended-cpts.zip" . -x ".git/*" -x "composer.*" -x ".gitignore" -x "release.sh"
  gh release create "${VERSION}" -n "Update extended-cpts to ${VERSION}"
  gh release upload "${VERSION}" "extended-cpts.zip"

fi