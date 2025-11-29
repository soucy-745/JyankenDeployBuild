#!/bin/sh
printf '\033c\033]0;%s\a' Jyanken
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Jyanken.x86_64" "$@"
