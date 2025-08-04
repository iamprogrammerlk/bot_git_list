#!/bin/bash

clear

# bash debug on
set -euo pipefail

export APP_NAME="GIT List"
export APP_SLUG="git_list"
export APP_VERSION="1.0.0"
# export APP_ROOT=$(pwd)
# export APP_ROOT=$(dirname "$0")
# These method ensure you get the directory of the script, even if it's executed from a different location.
# this option is more robust handling of symbolic links.
export APP_ROOT=$(dirname "$(realpath "$0")")
export APP_HOME=$HOME/.config/$APP_SLUG

declare -A app_configuration=(
  ["app_url"]="https://github.com/iamprogrammerlk/autobot"
  ["app_license"]="MIT license"
  ["app_license_url"]="https://github.com/iamprogrammerlk/autobot?tab=MIT-1-ov-file"
  ["app_author"]="I am Programmer"
  ["app_author_url"]="https://iamprogrammer.lk"
)

cd $HOME
if [ ! -d "$APP_HOME" ]; then
  mkdir "$APP_HOME"
fi

if [ ! -f "$APP_ROOT/library/config.sh" ]; then
  echo "Runtime Error : '/library/config.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/library/config.sh

if [ ! -f "$APP_ROOT/library/utility.sh" ]; then
  echo "Runtime Error : '/library/utility.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/library/utility.sh

if [ ! -f "$APP_ROOT/library/style.sh" ]; then
  echo "Runtime Error : '/library/style.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/library/style.sh

if [ ! -f "$APP_ROOT/library/ui.sh" ]; then
  echo "Runtime Error : '/library/ui.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/library/ui.sh

# show_app_header ------------------------------------------------------------------------------------------------------
show_app_header()
{
  declare -a header_title=(
    "style_foreground_blue"
    "ui_message_box_text_align_center"
    "$APP_NAME v$APP_VERSION"
    "This bot effectively reveals all the repositories found within the specified directories,"
    "providing you with a comprehensive overview of your projects."
  )
  ui_message_box "${header_title[@]}"
}

# show_app_footer ------------------------------------------------------------------------------------------------------
show_app_footer()
{
  declare -a footer_title=(
    "style_foreground_blue"
    "ui_message_box_text_align_center"
    "Thank you!"
    "ui_message_box_text_align_left"
    "   Developer : ${app_configuration["app_author"]} [${app_configuration["app_author_url"]}]"
    "     License : ${app_configuration["app_license"]} [${app_configuration["app_license_url"]}]"
    "     Version : $APP_VERSION"
  )
  ui_message_box "${footer_title[@]}"
}

show_app_header
empty_line

echo -n "$(style_foreground_red "Config File:") $(style_foreground_brown "$APP_HOME/root_directories.conf")"
new_line
empty_line

declare -a root_directories
get_config_list "$APP_HOME/root_directories.conf" "root_directories"
filtered_by=".git"

for root_directory in "${root_directories[@]}"
do
  project_directory_list=()

  # get the $filtered_by directories
  readarray -d '' directory_list < <(find $root_directory -name $filtered_by -type d)

  # sort alphabetically
  IFS=$'\n' sorted=($(sort <<<"${directory_list[@]}"))
  unset IFS

  # trim the tailing $filtered_by then add it to $directory_list
  for directory in ${sorted[@]}; do
    project_directory_list+=(${directory%$filtered_by})
  done

  # Get array length
  total_directory=${#project_directory_list[@]}

  echo -n "$(style_foreground_green "Root Directory:") $(style_foreground_brown "$root_directory")"
  new_line
  echo -n "Containing a total of $(style_foreground_purple "$total_directory") repositories."
  new_line
  empty_line

  for directory in ${project_directory_list[@]}; do
    echo "$directory"
  done
  empty_line

done

show_app_footer
empty_line
