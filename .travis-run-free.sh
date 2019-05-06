set -e
make build/libv86.js
make build/v86_all.js
ls -ltr ` find ./ -type f`
rm -rf ./.git ./.gitignore
mkdir -p images
(cd images && curl --compressed -O https://copy.sh/v86/images/linux3.iso)
GHP_URL=https://${GHP_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
git init
git config user.name "${USER}"
git config user.email "${GHP_MAIL}"
git add *
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "${GHP_URL}" master:gh-pages
