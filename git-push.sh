#!/bin/bash
GPH_PATH="/c/Users/tajo0/git-push-heroku.sh"

wantPush="n"

while [ $wantPush = "n" ]; do
  git add -A;

  echo "";
  echo "Put your commit message:";

  read commit_msg

  if [[ -n "${commit_msg}" ]]; then
    echo "";
    git commit -m "${commit_msg}";
  else
    echo "Commit message is necessary!";
    exit
  fi

  echo "Do you want to push it to the repository? (y/n) Type [gph] if you want to deploy to heroku.";

  read wantPush

  if [ $wantPush == "y" ]; then
    echo "";
    echo "Pushing to GitHub...";
    echo "";

    git push;
    echo "";
    echo "Successfully pushed to the repository!";
  else if [ $wantPush == "gph" ]; then
    echo "";
    exec "$GPH_PATH"
  else 
    echo "Works saved, but not pushed";
    exit
  fi

done
