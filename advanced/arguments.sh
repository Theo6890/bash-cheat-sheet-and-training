#!/bin/bash
if (($# > 0)); then
  echo "there is arg"
fi
if [[ "$1" != "" ]]; then
  echo "the argument is: $1"
fi

while getopts u:a:l: option; do
  # shellcheck disable=SC2220
  case "${option}" in
  u) USER=${OPTARG} ;;
  a) AGE=${OPTARG} ;;
  l) LOCATION=${OPTARG} ;;
  esac
done
echo "$USER $AGE $LOCATION"
