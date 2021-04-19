#!usr/bin/env sh

set -env
npm run build
cd dist
git init
git add .
git commit -m 'deploy'
git push -f git@github.com:Monsieur19/vue-app.git master:gh-pages
cd -