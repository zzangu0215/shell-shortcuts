#!/bin/bash

wantPush="n"

while [ $wantPush = "n" ]; do

  echo "Did you already create the app? (y/n) ";

  read wantCreateApp

  if [ $wantCreateApp == "n" ]; then
    echo "";
    echo "Type your app name (no space):";

    read app_name

    if [[ -n "${app_name}" ]]; then
      echo "";
      echo "Creating app to heroku...";
      echo "";

      heroku create app_name;

      echo "";
      echo "${app_name} app created!";
      echo "";
      echo "Type [dp] to deploy your app to heroku: ";
    else
      echo "App name required!";
      exit
    fi

  else
    echo "";
    echo "Type [dp] to deploy your app to heroku: ";
  fi

  read dp_ready

  if [ $dp_ready == "dp" ]; then
    echo "";
    echo "Deploying...";
    echo "";

    git push heroku main;
    echo "";
    echo "Successfully deployed!";
    echo "";
  else
    echo "See you again...";
    exit
  fi

  printf "Type [open] to open your heroku app. \nType [bye] to finish.";

  read herokuOpen

  if [ $herokuOpen == "open" ]; then
    echo "";
    echo "Opening...";
    echo "";

    heroku open;
    echo "";
    echo "Your app is opened!";
    exit
  else 
    echo "See you again...";
    exit
  fi

done