# GitHub Action for Sencha CMD
This action enables one to execute Sencha Cmd in a Github Actions workflow

## Inputs

### `dir`

**Required** The directory to run Sencha Cmd within. Default `"./web"`.

### `cmd`

**Required** The command to run. Default `"app build"`.

### Usage

```yaml
name: Sencha Cmd
on: [push]

jobs:
  buildAndDeploy:
    steps:
      name: Build ExtJS application
      uses: tribiahq/action-sencha-cmd@master
      with:
        dir: './web'
        cmd: 'app build'
```