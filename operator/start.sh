#!/bin/sh

GENESIS_HASH=`cat genesis-hash.txt`
echo "Genesis Hash: $GENESIS_HASH"

# echo '>>> Updating pool peers ...'
# ./cardano-update-conf.pl

./jcli rest v0 shutdown get --host "http://127.0.0.1:3100/api"

echo '>>> Starting jormungandr ...'
# nohup
./jormungandr --config itn_rewards_v1-config.yaml --secret node_secret.yaml --genesis-block-hash $GENESIS_HASH >> debug.log &