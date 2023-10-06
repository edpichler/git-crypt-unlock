# Unlocking a repository encrypted with Git-Crypt 

This GitHub action unlocks a repository previously encrypted with Git-Crypt and then locks it again when the job finishes.

## Usage

To use this action, you need a GPG key, its grip and passphrase on the secrets section of your repository.

- `GPG_KEY_GRIP` = `The sub key-grip`
- `GPG_PRIVATE_KEY` = `Base64 encoded version of the private key`
- `GPG_KEY_PASS` = `Key passphrase`
- `REPOSITORY_PATH` = A path to another folder, in case the repository you want to unlock is in another folder.

[Here is how to get the GPG key/secrets](SETUP_KEYS.md)

## Example

```yml
name: Test Git-Crypt Unlock Github Action 
on: 
  push:
      branches:    
          - master
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Git-Crypt Unlock
      uses: edpichler/github-action-git-crypt@1.0.0.170
      env: 
        GPG_PRIVATE_KEY: ${{ secrets.GPG_PRIVATE_KEY }}
        GPG_KEY_GRIP: ${{ secrets.GPG_KEY_GRIP }}
        GPG_KEY_PASS: ${{ secrets.GPG_KEY_PASS }}
        REPOSITORY_PATH: my-sub-folder
    # Any actions below here will have files have been decrypted.
    # At the end, everything will be locked again.
```
