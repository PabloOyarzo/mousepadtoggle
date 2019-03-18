#!/bin/bash

USER="user"
DEVICE='device'
HOME=/home/$USER/.scripts/mousepadtoggle

DEVICE_NUMBER=$(xinput --list | grep "${DEVICE}" | awk -F "\t" '{print $2}' | awk -F "=" '{print $2}')
INITIAL_STATE=$(cat $HOME/.state)

function toggle {
  if [ "$INITIAL_STATE" = "disable" ]
  then
    xinput --enable $DEVICE_NUMBER
    echo "enable" > $HOME/.state
  else
    xinput --disable $DEVICE_NUMBER
    echo "disable" > $HOME/.state
  fi
}

toggle
