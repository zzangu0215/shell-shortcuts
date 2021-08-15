# Shell Shorcuts - Your Life Saver

As a developer who is using github and heroku a lot, it is sometimes really annoying to type all the commands whenever we want to commit our work, or push and deploy.

Imagine we make typos while typing commands, and imagine we forgot to put our commit messages in quotes `""`! How annoying it is!

Here, I brought some nice shell shortcuts for you to make you less type when you are working on your project! **Less Type** and happy coding!

## 👍 Usage

1. Open your terminal, and type **`cd ~`** to get to the root directory.

2. Type **`touch git-push-heroku.sh`** to create `git-push-heroku.sh` file and type `code git-push-heroku.sh` to open the file in VS-Code.

3. Copy the codes below and paste it to `git-push-heroku.sh` that you just created.

- `git-push-heroku.sh` codes

  ```shell
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
  ```

4. Go back to your terminal, and create a new file named `git-push.sh` by typing **`touch git-push.sh`**.

5. Copy the codes below and paste it to `git-push.sh` that you just created.

- `git-push.sh` codes

  ```shell
  #!/bin/bash
  GPH_PATH="/path/to/the/git-push-heroku.sh"

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
  ```

**Notes**: Change the value of **`GPH_PATH`** to the real path of your `git-push-heroku.sh` file.  
You can check the path easily by typing the following commands in the terminal.

```shell
realpath git-push-heroku.sh
```

6. Open `.bashrc` file in the VS-Code, and add aliases for the two files `git-push.sh` and `git-push-heroku.sh`

```shell
alias gp="~/git-push.sh"

alias gph="~/git-push-heroku.sh"
```

7. Make some changes in your project, and type **`gp`** to start less typing experience! Have fun!

## 😎 Author

🖐 If you have any question about me or my project, feel free to contact me!

- **Jun Park**
  - Portfolio: [**Portfolio**](https://portfolio-v2-sjp.herokuapp.com/) (to be updated)
  - Email: **tajo0215@gmail.com**
  - **Github**: [**zzangu0215**](https://github.com/zzangu0215)
