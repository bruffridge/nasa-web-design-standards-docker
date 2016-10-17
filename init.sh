#!/bin/bash
set -e

if [ "$1" = 'init' ]; then
  echo "*-*-*-* INIT *-*-*-*"

  cd /apps/web-design-standards-docs/
  echo "*-*-*-* Installing Dependencies *-*-*-*"
  bundle install

  cd /apps/web-design-standards/
  echo "*-*-*-* Installing Standards *-*-*-*"
  npm install
  echo "*-*-*-* Building Standards *-*-*-*"
  npm run build:package
  echo "*-*-*-* Linking Standards *-*-*-*"
  npm link
  
  cd /apps/web-design-standards-docs/
  echo "*-*-*-* Installing Docs *-*-*-*"
  npm install
  echo "*-*-*-* Linking Standards to Docs *-*-*-*"
  npm link uswds
  echo "*-*-*-* Building Docs *-*-*-*"
  npm run build
elif [ "$1" = 'start' ]; then
  echo "*-*-*-* START *-*-*-*"

  cd /apps/web-design-standards-docs/
  echo "*-*-*-* Installing Dependencies *-*-*-*"
  bundle install

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