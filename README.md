# Fly Wordpress

Use this template to launching wordpress on fly.io

## Get Started

First install and authenticate with `flyctl` tool

```sh
curl -L https://fly.io/install.sh | sh

export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

fly auth login
```

Then launch from the template:

```sh
fly launch --from https://github.com/raven-consult/fly-wordpress --no-deploy
```

Update the environment variable from the example env file:

```sh
cp .env.example .env
vim .env
```

Then set the environment variables as fly.io secrets

```sh
cat .env | fly secrets import
```

Upon successful staging, you can then deploy

```sh
fly deploy --ha=false
```
