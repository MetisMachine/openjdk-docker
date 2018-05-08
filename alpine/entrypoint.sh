#!/bin/bash

if [ "$(ls -A /etc/envconsul)" ]; then
  ARGS=()
  for i in `find /etc/envconsul -name *.hcl -type f`; do
    echo "Loading config: $i"
    FILE=""
    DEREF=$(readlink -f $i)
    if [[ "$?" -eq 0 ]]; then FILE=$DEREF; else FILE=$i; fi
    ARGS+=("-config=$FILE")
  done
  ARGS+=("$@")
  echo "envconsul configured, using configured credentials"
  exec /usr/local/bin/envconsul "${ARGS[@]}"
else
  echo "envconsul not configured, running without vault credentials"
  exec "$@"
fi
