# Copyright (c) 2018 Pablo Oyarzo
# mousepadtoggle - mousetoggle.sh

#!/bin/bash

DEVICE='Touchpad'
LOCAL="$HOME/.scripts/mousepadtoggle/.state"

DEVICE_NUMBER=$(xinput --list | grep "${DEVICE}" | awk -F "\t" '{print $2}' | awk -F "=" '{print $2}')
INITIAL_STATE=$(cat $LOCAL)

function toggle {
  if [ "$INITIAL_STATE" = "disable" ]
  then
    xinput --enable $DEVICE_NUMBER
    echo "enable" > $LOCAL
  else
    xinput --disable $DEVICE_NUMBER
    echo "disable" > $LOCAL
  fi
}

toggle
