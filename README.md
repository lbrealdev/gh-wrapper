# gh-wrapper
Simple shell script with `gh cli` wrapped.

### Use

To run this script, make sure you have gh cli installed and authenticated with your token.

Authenticate with a GitHub host using a PAT (personal access token):
```shell
echo "<your-github-token>" | gh auth login --with-token
```

To verify that your login is correct, run:
```shell
gh auth status
```

**NOTE**: Once authenticated, you will remain logged in until you log out or the token used expires.

To clone your repository run:
```shell
./gh-wrapper <repository-name>
```

Create a syslink to run **`gh-wrapper.sh`** from anywhere in your terminal:
```shell
ln -s /script/absolute/path/gh-wrapper.sh /usr/local/gh-wrapper.sh

gh-wrapper.sh <repository>
```
