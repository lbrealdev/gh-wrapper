# gh-wrapper
Simple shell for github.

### Use

```shell
$ export GITHUB_TOKEN="<your-github-access-token>"

$ ./gh-wrapper <repository>
```

Create a syslink to run **`gh-wrapper.sh`** from anywhere in your terminal:
```shell
$ ln -s /script/absolute/path/gh-wrapper.sh /usr/local/gh-wrapper.sh

$ gh-wrapper.sh <repository>
```
