#!/bin/bash

wantPush="n"

while [ $wantPush = "n" ]; do
  git add -A;

  echo "Put your commit message:";

  read commit_msg

  if [[ -n "${commit_msg}" ]]; then
    git commit -m ${commit_msg};
  else
    echo "Commit message is necessary!";
    exit
  fi

  echo "Do you want to push it to the repository? (y/n) ";

  read wantPush

  if [ $wantPush == "y" ]; then
    echo "Pushing...";
    echo "";

    git push;
    echo "";
    echo "Successfully pushed to the repository!";
  else 
    echo "Works saved, but not pushed";
    exit
  fi

  # git commit -m ${commit_msg};

  # git push;
done
# else
#   echo "Everything is up to date";
# fi;