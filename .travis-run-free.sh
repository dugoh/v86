set -e
make build/libv86.js
make build/v86_all.js
#cp -p ./build/* ./
ls -ltr ` find ./ -type f`
rm -rf ./.git
GHP_URL=https://${GHP_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
git init
git config user.name "${USER}"
git config user.email "${GHP_MAIL}"
git add .
git add build
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "${GHP_URL}" master:gh-pages
