# Git scripts

## gh-wrapper

Simple shell script with `gh cli` wrapped.

### Use

To run this script, make sure you have [gh cli](https://github.com/cli/cli) installed and authenticated with your token.

Authenticate with a GitHub host using a PAT ([Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)):
```shell
echo "<github-token>" | gh auth login --with-token
```

To verify that your login is correct, run:
```shell
gh auth status
```

**NOTE**: Once authenticated, you will remain logged in until you log out or the token used expires.

To clone your repository run:
```shell
./gh-wrapper <repository>
```

Create a syslink to run **`gh-wrapper.sh`** from anywhere in your terminal:
```shell
ln -s /script/absolute/path/gh-wrapper.sh /usr/local/gh-wrapper.sh

gh-wrapper.sh <repository>
```

## git-wrapper (clone)

Simple shell script with `git` wrapped.

### Use

Export the following environment variables:
```shell
export GH_USER="<github-user>"
export GH_AUTH_TOKEN="<github-token>"
```

Create an alias to run `git-wrapper` from anywhere in your terminal:
```shell
echo "alias clone='$(readlink -f git-wrapper.sh)'" >> ~/.bashrc

source ~/.bashrc
```

**NOTE**: You can do this procedure for `gh-wrapper.sh`, as it also works via alias.

Clone repository with the `clone` alias command:
```shell
clone <repository>
```
