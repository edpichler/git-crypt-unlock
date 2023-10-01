#!/bin/sh

echo "$GPG_PRIVATE_KEY" | base64 -d | gpg --batch --import

gpgconf --kill gpg-agent

gpg-agent --daemon --allow-preset-passphrase --max-cache-ttl 3153600000

/usr/libexec/gpg-preset-passphrase --preset --passphrase "$GPG_KEY_PASS" "$GPG_KEY_GRIP"

cd "$REPOSITORY_PATH"
git-crypt unlock