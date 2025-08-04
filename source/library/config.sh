#!/bin/bash

# Parameter $1 <STRING> | path/to/config/file
# Parameter $2 <STRING> | array name for returned data
get_config()
{
  if [ -z ${1+x} ]; then
    echo "Runtime Error : Invalid argument. 'get_config <STRING>'" >&2
    exit 1
  fi

  # file not exist, creating a new one
  if [ ! -f "$1" ]; then
    echo "app_name=$APP_NAME" > "$1"
    echo "app_slug=$APP_SLUG" >> "$1"
    echo "app_version=$APP_VERSION" >> "$1"
  fi

  local -n array_reference="$2"

  while IFS= read -r line;
  do
    # Skip comments and empty lines
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    [[ -z "$line" ]] && continue

    # Parse key=value pairs
    if [[ "$line" =~ ^([^=]+)=(.*)$ ]]; then
      key="${BASH_REMATCH[1]}"
      value="${BASH_REMATCH[2]}"
      array_reference["$key"]+="$value"
    fi
  done < $1
}

# Parameter $1 <STRING> | path/to/config/file
# Parameter $2 <STRING> | array name for returned data
get_config_list()
{
  if [ -z ${1+x} ]; then
    echo "Runtime Error : Invalid argument. 'get_config <STRING>'" >&2
    exit 1
  fi

  # file not exist, creating a new one
  if [ ! -f "$1" ]; then
    echo "$APP_ROOT" > "$1"
  fi

  local -n array_reference="$2"

  while read -r line;
  do
    # Skip comments and empty lines
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    [[ -z "$line" ]] && continue

    array_reference+=("$line")
  done < $1
}
