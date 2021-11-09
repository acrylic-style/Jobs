#!/usr/bin/env bash
export target="$1"
export branch="$2"
declare -A GH_URL
GH_URL[Jobs]='https://github.com/Zrips/Jobs'
if [ ! -e "work/$target" ]; then
  mkdir -p "work"
  git clone "${GH_URL[$target]}" "work/$target"
fi
(
  echo "Updating data" &&
  # git submodule update --init &&
  cd "work/$target" &&
  git fetch --all &&
  git checkout "v4.17.2" &&
  git branch -d "$branch" ;
  git switch -c "$branch" &&
  cd ../.. &&
  echo "Updated data"
) || exit 1
