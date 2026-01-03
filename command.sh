#!/usr/bin/env bash
# Commands used for Propeller React App task

# 1. Create React app
npx create-react-app create-react-app

cd create-react-app

# 2. Initialize git, commit, create GitHub repo via gh
git init
git add .
git commit -m "Initial React app"
gh repo create propeller-react-app --public --source=. --remote=origin --push

# 3. Switch branch to update_logo
git checkout -b update_logo

# 4. Replace logo SVG (download and overwrite src/logo.svg)
curl -o src/logo.svg https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg

# 5. Update link in src/App.js
#   (edited App.js manually to use: https://www.propelleraero.com/dirtmate/)

git add src/logo.svg src/App.js
git commit -m "Update logo SVG and DirtMate link"

# 6. Push update_logo branch
git push -u origin update_logo

# 7. Create PR from update_logo to main
gh pr create --base main --head update_logo --title "Update logo and link" --body "Replace logo SVG and update link to DirtMate."

# 8. Merge PR using GitHub CLI
gh pr merge --merge

# REPO_URL https://github.com/vantran1102/propeller-react-app
