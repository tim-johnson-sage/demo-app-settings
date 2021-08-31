#!/bin/sh

export CONFIG_JSON_FILE=config.json

eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

echo $CONTACTS_HOST
echo $GENERAL_LEDGER_SETUP_HOST


printenv > $CONFIG_JSON_FILE

echo "------------------------------TEST-----------------------" >> $CONFIG_JSON_FILE
echo $'{ \"REACT_APP_CONTACTS_HOST\": \"$CONTACTS_HOST\" }' >> $CONFIG_JSON_FILE

exec "$@"
