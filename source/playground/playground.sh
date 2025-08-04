#!/bin/bash

clear

# bash debug on
set -euo pipefail

export APP_NAME="Template Bash Script - Playground"
export APP_SLUG="template_bash_script_playground"
export APP_VERSION="1.0.0"
# export APP_ROOT=$(pwd)
# export APP_ROOT=$(dirname "$0")
# These method ensure you get the directory of the script, even if it's executed from a different location.
# this option is more robust handling of symbolic links.
export APP_ROOT=$(dirname "$(realpath "$0")")
export APP_HOME=$HOME/.config/$APP_SLUG

declare -A app_configuration=(
  ["app_url"]="https://github.com/iamprogrammerlk/template_bash_script"
  ["app_license"]="MIT license"
  ["app_license_url"]="https://github.com/iamprogrammerlk/template_bash_script?tab=MIT-1-ov-file"
  ["app_author"]="I am Programmer"
  ["app_author_url"]="https://iamprogrammer.lk"
)

demo_string_to_be_format="This string formatting is applied by calling function "

cd $HOME
if [ ! -d "$APP_HOME" ]; then
  mkdir "$APP_HOME"
fi

if [ ! -f "$APP_ROOT/../library/config.sh" ]; then
  echo "Runtime Error : '/library/config.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/config.sh

if [ ! -f "$APP_ROOT/../library/utility.sh" ]; then
  echo "Runtime Error : '/library/utility.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/utility.sh

if [ ! -f "$APP_ROOT/../library/style.sh" ]; then
  echo "Runtime Error : '/library/style.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/style.sh

if [ ! -f "$APP_ROOT/../library/ui.sh" ]; then
  echo "Runtime Error : '/library/ui.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/ui.sh


# show_app_header ------------------------------------------------------------------------------------------------------
show_app_header()
{
  declare -a header_title=(
    "style_foreground_blue"
    "ui_message_box_text_align_center"
    "$APP_NAME v$APP_VERSION"
  )
  ui_message_box "${header_title[@]}"
}

# show_app_footer ------------------------------------------------------------------------------------------------------
show_app_footer()
{
  declare -a footer_title=(
    "style_foreground_gray"
    "ui_message_box_text_align_center"
    "Thank you!"
    "ui_message_box_text_align_left"
    "   Developer : ${app_configuration["app_author"]} [${app_configuration["app_author_url"]}]"
    "     License : ${app_configuration["app_license"]} [${app_configuration["app_license_url"]}]"
    "     Version : $APP_VERSION"
  )
  ui_message_box "${footer_title[@]}"
}


# demo_style_text_format -----------------------------------------------------------------------------------------------
demo_style_text_format(){
  style_normal "$demo_string_to_be_format style_normal"
  new_line
  style_bold "$demo_string_to_be_format style_bold"
  new_line
  style_italic "$demo_string_to_be_format style_italic"
  new_line
  style_underline "$demo_string_to_be_format style_underline"
  new_line
  style_blinking "$demo_string_to_be_format style_blinking"
  new_line
  style_reverse_video "$demo_string_to_be_format style_reverse_video"
  new_line
}

# demo_style_text_foreground -------------------------------------------------------------------------------------------
demo_style_text_foreground(){
  style_foreground_black "$demo_string_to_be_format style_foreground_black"
  new_line
  style_foreground_blue "$demo_string_to_be_format style_foreground_blue"
  new_line
  style_foreground_blue_bold "$demo_string_to_be_format style_foreground_blue_bold"
  new_line
  style_foreground_brown "$demo_string_to_be_format style_foreground_brown"
  new_line
  style_foreground_brown_bold "$demo_string_to_be_format style_foreground_brown_bold"
  new_line
  style_foreground_cyan "$demo_string_to_be_format style_foreground_cyan"
  new_line
  style_foreground_cyan_bold "$demo_string_to_be_format style_foreground_cyan_bold"
  new_line
  style_foreground_gray "$demo_string_to_be_format style_foreground_gray"
  new_line
  style_foreground_gray_bold "$demo_string_to_be_format style_foreground_gray_bold"
  new_line
  style_foreground_green "$demo_string_to_be_format style_foreground_green"
  new_line
  style_foreground_green_bold "$demo_string_to_be_format style_foreground_green_bold"
  new_line
  style_foreground_purple "$demo_string_to_be_format style_foreground_purple"
  new_line
  style_foreground_purple_bold "$demo_string_to_be_format style_foreground_purple_bold"
  new_line
  style_foreground_red "$demo_string_to_be_format style_foreground_red"
  new_line
  style_foreground_red_bold "$demo_string_to_be_format style_foreground_red_bold"
  new_line
  style_foreground_white "$demo_string_to_be_format style_foreground_white"
  new_line
}

# demo_style_text_background -------------------------------------------------------------------------------------------
demo_style_text_background(){
  style_background_black "$demo_string_to_be_format style_background_black"
  new_line
  style_background_blue "$demo_string_to_be_format style_background_blue"
  new_line
  style_background_blue_bold "$demo_string_to_be_format style_background_blue_bold"
  new_line
  style_background_brown "$demo_string_to_be_format style_background_brown"
  new_line
  style_background_brown_bold "$demo_string_to_be_format style_background_brown_bold"
  new_line
  style_background_cyan "$demo_string_to_be_format style_background_cyan"
  new_line
  style_background_cyan_bold "$demo_string_to_be_format style_background_cyan_bold"
  new_line
  style_background_gray "$demo_string_to_be_format style_background_gray"
  new_line
  style_background_gray_bold "$demo_string_to_be_format style_background_gray_bold"
  new_line
  style_background_green "$demo_string_to_be_format style_background_green"
  new_line
  style_background_green_bold "$demo_string_to_be_format style_background_green_bold"
  new_line
  style_background_purple "$demo_string_to_be_format style_background_purple"
  new_line
  style_background_purple_bold "$demo_string_to_be_format style_background_purple_bold"
  new_line
  style_background_red "$demo_string_to_be_format style_background_red"
  new_line
  style_background_red_bold "$demo_string_to_be_format style_background_red_bold"
  new_line
  style_background_white "$demo_string_to_be_format style_background_white"
  new_line
}

# demo_style_combine_use_case ------------------------------------------------------------------------------------------
demo_style_combine_use_case()
{
  echo -n "$(style_blinking "<<-- SAMPLE -->>") Mix the Foreground Color $(style_foreground_brown "Brown") with the " 
  echo -n "$(style_foreground_brown_bold "Brown Bold") and Background Color $(style_background_purple " Purple ") on "
  echo "$(style_reverse_video "$(style_underline " BASH ")")"
  # No 'new_line' need here, becurse last 'echo' don't have '-n' flag
}

# demo_ui_message_box --------------------------------------------------------------------------------------------------
demo_ui_message_box()
{
  #  default title with default options
  ui_message_box
  empty_line

  #  default title with custom color options
  ui_message_box "style_foreground_blue"
  empty_line

  #  default title with custom text alignment options
  ui_message_box "ui_message_box_text_align_left"
  empty_line

  ui_message_box "Custom title with default options"
  empty_line

  ui_message_box "style_foreground_blue" "Custom title with custom color options"
  empty_line

  options=(
    "style_foreground_green" 
    "ui_message_box_text_align_left" 
    "Custom title with custom color and text align options"
  )
  ui_message_box "${options[@]}"
  empty_line

  options=(
    "style_foreground_green" 
    "ui_message_box_text_align_left" 
    "Custom title with custom color,text align and content options"
    "after this, all arguments"
    "Will"
    "Be"
    "The Content"
  )
  ui_message_box "${options[@]}"
  empty_line

  options=(
    "style_background_cyan_bold" 
    "ui_message_box_text_align_center" 
    "Custom title with custom color, text align and content, align options"
    "ui_message_box_text_align_left" 
    "after this, all arguments"
    "Will"
    "Be"
    "The Content"
  )
  ui_message_box "${options[@]}"
  empty_line
}



show_app_header
empty_line

demo_style_text_format
empty_line
demo_style_text_foreground
empty_line
demo_style_text_background
empty_line
demo_style_combine_use_case
empty_line

demo_ui_message_box
empty_line

echo "Getting App settings from .conf file"
# an associative array to hole returned data
declare -A settings
# Pass file path and array name to the get_config()
# A new file will created if doesn't exist
get_config "$APP_HOME/settings.conf" "settings"
# Accessing the values
echo "${settings["app_name"]}"
echo "${settings["app_slug"]}"
echo "${settings["app_version"]}"
empty_line

show_app_footer
empty_line
