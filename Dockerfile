FROM alpine:3.12

LABEL "name"="Github Action for git-crypt"
LABEL "com.github.actions.icon"="unlock"
LABEL "com.github.actions.color"="red"
LABEL "com.github.actions.name"="Github Action for git-crypt"
LABEL "com.github.actions.description"="Action to Unlock (and then lock) files encrypted by git-crypt, also supporting gpg keys with passphrase"

RUN apk --update add ca-certificates bash curl git g++ gnupg make openssh openssl openssl-dev

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh
COPY exit.sh /exit.sh
CMD ["chmod", "+", "/exit.sh"]
RUN apk --update add git-crypt git-lfs

ENTRYPOINT ["/entrypoint.sh"]