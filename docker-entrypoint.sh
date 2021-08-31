#!/bin/sh

# #!/usr/bin/env sh
# set -eu

# # We only want to substitute environment variables
# # Relevant to our application
# # we can avoid a potential race condition by printing 
# # the config file contents, performing the command, 
# # then overwrite the original file
# export CONFIG_JSON_FILE=config.json
# cat $CONFIG_JSON_FILE | envsubst '
#     $CONTACTS_HOST 
#     $GENERAL_LEDGER_SETUP_HOST' > $CONFIG_JSON_FILE

# exec "$@"
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

echo $CONTACTS_HOST
echo $GENERAL_LEDGER_SETUP_HOST


printenv > config.json

# export CONFIG_JSON_FILE=config.json
# cat $CONFIG_JSON_FILE | envsubst '
#     $SSH_PASSWD 
#     $HELLO'> $CONFIG_JSON_FILE

# exec "$@"

exec "$@"
