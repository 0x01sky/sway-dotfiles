#!/usr/bin/env bash
pkill -x udiskie

if command -v udiskie &>/dev/null; then
   
   while pgrep -x udiskie >/dev/null; do
     sleep 0.2
   done

   exec udiskie --tray --notify
else
  return
fi
