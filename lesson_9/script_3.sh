#!/bin/bash

./strict.sh

echo "enter password length";
read -r length


if [[ "${length}" -lt 8 || "${length}" -gt 32 ]]
then
  echo "${0}: ERR: length should be between 8 and 32"
  exit 1
fi

sudo cat /dev/urandom | tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-:;<=>?@[\]^_`{|}~' | head -c"${length}"; printf "\n"
