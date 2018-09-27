#!/bin/bash

USER="user"
HOME=/home/$USER/test/mousetoggle/
DEVICE=12
INITIAL_STATE=$(cat $HOME/.state)

function toggle {
  if [ "$INITIAL_STATE" = "disable" ]
  then
    xinput --disable $DEVICE
    echo "enable" > $HOME/.state
  else
    xinput --enable $DEVICE
    echo "disable" > $HOME/.state
  fi
}
