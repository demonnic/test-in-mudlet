# test-in-mudlet

A github action to run your busted test specs inside of Mudlet.

[Busted](https://olivinelabs.com/busted/#overview) is a featureful testing framework for testing Lua code, and is the framework that Mudlet makes use of for testing its own Lua API.

Now you can use it to test your own Mudlet packages on github inside of Mudlet itself.

It's designed to work easily with the [build-with-muddler](https://github.com/demonnic/build-with-muddler) github action I created for using [muddler](https://github.com/demonnic/muddler) to build packages, and as such will default to the build/tmp directory created by muddler to look for tests, but you can specify anything you like.

## Inputs

Name | Description | Default
--- | --- | ---
mudletVersion | The version of Mudlet to use. example: Mudlet-4.16.0 | LATEST
pretestPackage | The path to a package file to install prior to running tests. | NONE
testsDirectory | The directory which contains your tests. | `${{ github.workspace }}/build/tmp/`

## Usage Example

The following setup builds a package with muddler, and then runs its test specs inside of Mudlet

```yaml
name: Build project using muddler and upload artifact

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Muddle
        uses: demonnic/build-with-muddler@v1.2
      
      - name: Upload Artifact
        uses: actions/upload-artifact@v2
        with:
          name: MyCoolPackageName
          path: build/tmp/

      # This is the relevant bit
      - name: Run Busted tests
        uses: demonnic/test-in-mudlet@v1.0
        with:
          # MyCoolPackageName would be set by your mfile in this example, but you could point to any
          # xml or mpackage contained within your repository if you're not using muddler.
          pretestPackage: ${{ github.workspace }}/build/MyCoolPackageName.mpackage

```

## TO-DO

Add dependencies to allow for asynchronous busted tests, making tests for things that use tempTimers and the like possible.
