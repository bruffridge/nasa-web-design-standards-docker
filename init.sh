#!/bin/bash
set -e

if [ "$1" = 'init' ]; then
  echo "*-*-*-* INIT *-*-*-*"
  cd /apps/web-design-standards/
  npm install
  npm run build:package
  npm link

  cd /apps/web-design-standards-docs/
  npm install
  npm link uswds
  npm run build
elif [ "$1" = 'start' ]; then
  echo "*-*-*-* START *-*-*-*"

  # config gh-pages: uncomment the next two lines if you wish to deploy site to github pages gh-pages branch.
  #eval "$(ssh-agent -s)"
  #ssh-add ~/.ssh/id_rsa
  # enter your ssh key passphrase if set.

  cd /apps/web-design-standards/
  echo "*-*-*-* Linking Standards *-*-*-*"
  npm link
  cd /apps/web-design-standards-docs/
  echo "*-*-*-* Linking Standards to Docs *-*-*-*"
  npm link uswds
  echo "*-*-*-* Starting Node Server *-*-*-*"
  npm start
else
  exec bash
fi