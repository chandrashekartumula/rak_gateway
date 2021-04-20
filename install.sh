#!/bin/bash

# Stop on the first sign of trouble
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi



SCRIPT_COMMON_FILE=$(pwd)/rak/rak/shell_script/rak_common.sh
source $SCRIPT_COMMON_FILE

rpi_model=3
CREATE_IMG=1 #to run install_normal.sh in lora directory
INSTALL_CHIRPSTACK=1

#apk update

pushd rak
./install.sh $CREATE_IMG
sleep 1
popd

set +e
write_json_chirpstack_install $INSTALL_CHIRPSTACK
set -e


pushd lora
./install.sh $CREATE_IMG
sleep 1
popd



echo_success "*********************************************************"
echo_success "*  The RAKwireless gateway is successfully installed!   *"
echo_success "*********************************************************"
