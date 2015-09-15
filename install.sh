#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "usage: $0 install-path"
    echo "e.g: $0 /usr/local/bin"
    exit 1
fi

INSTALL_PATH=$1

if [ -z "$REGISSHTRY_REMOTE" ]; then
  echo "\$REGISSHTRY_REMOTE not set";
  exit 1
fi

cat regisshtry-receive | ssh $REGISSHTRY_REMOTE "cat > ${INSTALL_PATH}/regisshtry-receive"

cp regisshtry-pull ${INSTALL_PATH}
cp regisshtry-push ${INSTALL_PATH}
