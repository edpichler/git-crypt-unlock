# How to setup Secrets

Assuming you are using Git-Crypt to encrypt files on your repository.

## Key-ID and Key-Grip

First list the keys:

```shell

gpg -k

```

Output:
```shell
    rsa2048 2019-10-24 [SC]
        7990C753D77DA6742978E3E9876E1372C66DC017 #<<<< KEYID
    uid           [ultimate] Demo Key (Key cool encryptions) <test@domain.com>
    sub   rsa2048 2019-10-24 [E]
```

Get the Key Grip using the KEYID of the key that has been added to Git-Crypt

```
gpg --with-keygrip --list-key 7990C753D77DA6742978E3E9876E1372C66DC017
```

Output:

```shell
    pub   rsa2048 2019-10-24 [SC]
        7990C753D77DA6742978E3E9876E1372C66DC017
        Keygrip = 235F76EB811DE5F90720DA4AE1E0E5FC5F3150B2
    uid           [ultimate] Demo Key (Key cool encryptions) <test@domain.com>
    sub   rsa2048 2019-10-24 [E]
        Keygrip = 22FFE68D641883FBA8BB2872F7BE5BED55279AE4 #<<<< GPG_KEY_GRIP
```

Use the sub keygrip `22FFE68D641883FBA8BB2872F7BE5BED55279AE4` as the `GPG_KEY_GRIP` variable

## Private Key

Export the private key to ascii using `KEYID` ie `7990C753D77DA6742978E3E9876E1372C66DC017`

```shell
gpg -a --export-secret-keys $KEYID | base64 
```

Take the base64 string from above command and assign to `GPG_PRIVATE_KEY`

## Passphrase

Now take create a new GitHub secret `GPG_KEY_PASS` whose value is the passphrase of your GPG key.


## Wrap up

You should now have the following secrets.

- `GPG_KEY_GRIP` = `The sub key-grip`
- `GPG_PRIVATE_KEY` = `Base64 encoded version of the private key`
- `GPG_KEY_PASS` = `Key passphrase`
