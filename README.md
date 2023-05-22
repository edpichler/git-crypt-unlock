# Unwlock a repository encrypted with Git-Crypt 

GitHub action for unlocking files encrypted using Git-Crypt on your repository, and then locking it again when the job finishes.

## Usage

To use this action, you need a GPG key, its grip and passphrase on the secrets section of your repository.

- `GPG_KEY_GRIP` = `The sub key-grip`
- `GPG_PRIVATE_KEY` = `Base64 encoded version of the private key`
- `GPG_KEY_PASS` = `Key passphrase`

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
      uses: edpichler/github-action-git-crypt@1.0.0.166
      env: 
        GPG_PRIVATE_KEY: ${{ secrets.GPG_PRIVATE_KEY }}
        GPG_KEY_GRIP: ${{ secrets.GPG_KEY_GRIP }}
        GPG_KEY_PASS: ${{ secrets.GPG_KEY_PASS }}
    # Any actions below here will have files have been decrypted.
    # At the end, everything will be locked again.
```
