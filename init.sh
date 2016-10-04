#!/bin/bash
set -e

# config gh-pages: uncomment the next two lines if you wish to deploy site to github pages gh-pages branch.
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
# enter your ssh key passphrase if set.

if [ "$1" = 'init' ]; then
  cd /apps/web-design-standards/
  npm install
  npm run build:package
  npm link

  cd /apps/web-design-standards-docs/
  npm install
  npm link uswds
  npm run build
fi

exec bash