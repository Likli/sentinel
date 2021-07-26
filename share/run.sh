#!/usr/bin/env bash

# SIGTERM-handler
term_handler() {
  exit 0
}
trap term_handler SIGTERM

echo "" > /.hcccore/hcc.conf
if [ -n "$rpcuser" ]; then
  echo "rpcuser=${rpcuser}" >> /.hcccore/hcc.conf
fi
if [ -n "$rpcpassword" ]; then
  echo "rpcpassword=${rpcpassword}" >> /.hcccore/hcc.conf
fi
if [ -n "$rpcbind" ]; then
  echo "rpcbind=${rpcbind}" >> /.hcccore/hcc.conf
fi
if [ -n "$rpcallowip" ]; then
  echo "rpcallowip=${rpcallowip}" >> /.hcccore/hcc.conf
fi
if [ -n "$addnode" ]; then
  echo "addnode=${addnode}" >> /.hcccore/hcc.conf
fi
if [ -n "$externalip" ]; then
  echo "externalip=${externalip}" >> /.hcccore/hcc.conf
fi
if [ -n "$masternodeblsprivkey" ]; then
  echo "masternodeblsprivkey=${masternodeblsprivkey}" >> /.hcccore/hcc.conf
fi
if [ -n "$listen" ]; then
  echo "listen=${listen}" >> /.hcccore/hcc.conf
fi
if [ -n "$server" ]; then
  echo "server=${server}" >> /.hcccore/hcc.conf
fi

echo "" > /sentinel/sentinel.conf

if [ -n "$RPCHOST" ]; then
  echo "rpchost=${RPCHOST}" >> /sentinel/sentinel.conf
  echo "dash_conf=/.hcccore/hcc.conf" >> /sentinel/sentinel.conf
  echo "network=mainnet" >> /sentinel/sentinel.conf
  echo "db_name=database/sentinel.db" >> /sentinel/sentinel.conf
  echo "db_driver=sqlite" >> /sentinel/sentinel.conf
fi

while true; do
  python ./bin/sentinel.py
  sleep 1m
done
