# SOMEF GitHub Action

This action uses [SOMEF](https://github.com/KnowledgeCaptureAndDiscovery/somef) to generate a .[codemeta](https://codemeta.github.io/) file and meet the recommendations from [howfairis](https://github.com/fair-software/howfairis)

## Basic usage
In its more basic usage, the github action only uses SOMEF to generate a `codemeta.json` file.

```yaml
on: [push]

jobs:
  somef_job:
    runs-on: ubuntu-latest
    name: Run SOMEF
    steps:
    # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
    - name: Chechout repo
      uses: actions/checkout@v2

    # Use SOMEF generate codemeta.json
    - name: Somef with repo-url input
      uses: KnowledgeCaptureAndDiscovery/somef-github-action@main
      with:
        repo-url: "https://github.com/${{ github.repository }}"   
```

## Advanced workflow
A more advanced workflow uses [howfairis](https://github.com/marketplace/actions/fair-software) and
[Create Pull Request](https://github.com/marketplace/actions/create-pull-request) actions to create a *howfairis*  badge and send a pull request with the generated codemeta.json file if necessary:

```yaml
on: [push]

jobs:
  somef_job:
    runs-on: ubuntu-latest
    name: Test somef
    steps:
    # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
    - name: Chechout repo
      uses: actions/checkout@v2

    # Run howfairis
    - name: fair-software
      uses: fair-software/howfairis-github-action@0.1.0
      with:
        MY_REPO_URL: "https://github.com/${{ github.repository }}"

    # Use SOMEF generate codemeta.json
    - name: Somef with repo-url input
      uses: KnowledgeCaptureAndDiscovery/somef-github-action@main
      with:
        repo-url: "https://github.com/${{ github.repository }}"

    # Create a PR
    - name: Create Pull Request
      uses: peter-evans/create-pull-request@v3.8.2
      with:
        title: Generating codemeta template
        commit-message: Add codemeta.json template
        committer: GitHub <noreply@github.com>
        author: ${{ github.actor }} <${{ github.actor }}@users.noreply.github.com>
        labels: automated pr
        branch: add-codemeta
```
