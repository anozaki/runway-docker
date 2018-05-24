# Runway Docker Image

This docker image contains everything you need to execute runway using docker. The main goal of this docker image is to
make runway usage easier on all platform that docker is supported.

## Setup

To make deployment work similar to runway I suggest you add the following to your .bash_profile or similar so you can
run runway with out providing all these parameter every single time.

`alias runway='docker run -it --rm -v$PWD:/src -v~/.aws:/root/.aws --env DEPLOY_ENVIRONMENT=$DEPLOY_ENVIRONMENT --env AWS_PROFILE=$AWS_PROFILE --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY --env AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN anozaki/runway runway'`

**Please replace `~/.aws` with your .aws absolute path or if you do not use .aws you can omit this volume attachment**

### Running

With the above alias to run simply go to the directly that contains `runway.yml` and execute the following command.

```bash
runway deploy
```

If you want to pass set DEPLOY_ENVIRONMENT you can run the following command.

```bash
DEPLOY_ENVIRONMENT=dev && runway deploy
```

This will execute runway with `dev` as the deployment environment.