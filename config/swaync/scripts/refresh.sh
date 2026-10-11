#!/usr/bin/env bash

if command -v swaync &>/dev/null; then
  swaync-client -R
  swaync-client -rs
else
  return


