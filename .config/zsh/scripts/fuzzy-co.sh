#!/bin/bash
target=$(git branch -r | sed "s|origin/||" | sed "s/^[[:space:]]*//" | fzf)
read -r -p "run git checkout $target? (Y/n): " response
case "$response" in
[yY] | [yY][eE][sS] | "")
  echo "Checking into $target"
  git co $target
  ;;
[nN] | [nN][oO])
  echo "Aborting"
  ;;
*)
  echo "Invalid input. Operation aborted."
  ;;
esac
