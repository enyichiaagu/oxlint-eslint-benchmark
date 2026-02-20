#!/usr/bin/env bash

echo "========================================================="
echo "Comparing Oxlint to ESLint performance in React Router"
echo "========================================================="
echo ""

# Create tmp directory for React Router Repo
mkdir -p tmp
pushd tmp

# Clone React Router repository
if [ ! -d ".git" ]; then
    echo "Cloning React Router repository..."
    git clone --depth=1 https://github.com/remix-run/react-router.git .
else
    echo "VSCode repository already exists, skipping..."
fi

popd

# Install dependencies
echo ""
echo "Installing dependencies..."
npm install

# Clean up old eslint configs
echo ""
echo "Cleaning up old ESLint configs..."

rm -rf ./tmp/.eslintrc
rm -rf ./tmp/**/.eslintrc
rm -rf ./tmp/**/.eslintrc.js
rm -rf ./tmp/**/.eslintrc.json

OXLINT="$PWD/node_modules/.bin/oxlint -c configs/.oxlintrc.json tmp"
ESLINT="$PWD/node_modules/.bin/eslint -c configs/eslint.config.mjs tmp"

hyperfine -w 1 -i \
  -n oxlint "${OXLINT}" \
  -n eslint "${ESLINT}"
