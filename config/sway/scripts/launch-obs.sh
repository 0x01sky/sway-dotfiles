#!/usr/bin/env bash
pkill -x obs

if command -v obs &>/dev/null; then 
  
  while pgrep -x obs >/dev/null; do 
    sleep 0.2
  done

  exec obs --minimize-to-tray
else
  return
fi


