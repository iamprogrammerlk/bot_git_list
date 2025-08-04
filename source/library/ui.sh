#!/bin/bash

_page_width=120
_divider_symbol="#"
_fill_symbol=" "
_border="###"

_ui_message_box_divider()
{
  local divider=""
  local i=1
  while [[ $i -le $_page_width ]] ; do
    divider="$divider$_divider_symbol"
    (( i += 1 ))
  done
  echo -e "$divider"
}

_ui_message_box_fill()
{
  local fill=""
  local border_width=$(expr length "$_border")
  local _page_width=$(( $_page_width - ($border_width * 2) ))
  local i=1
  while [[ $i -le $_page_width ]] ; do
    fill="$fill$_fill_symbol"
    (( i += 1 ))
  done
  echo -e "$_border$fill$_border"
}

# BEWARE: Usage of unicode characters and emojis will messed up the text alignment.
# Parameter $1 <STRING> | string to be centered (input)
ui_message_box_text_align_center()
{
  if [ -z ${1+x} ]; then
    echo "Runtime Error : Invalid argument. 'ui_message_box_text_align_center <STRING>'" >&2
    exit 1
  fi
  local text="$1"
  local before_fill=""
  local after_fill=""
  local string_length=$(expr length "$text")
  is_even=$string_length%2;
  if [[ $is_even -ne 0 ]];
  then
      local text="$text "
      local string_length=$(expr length "$text")
  fi
  local border_width=$(expr length "$_border")
  local _page_width=$(( $_page_width - ($border_width * 2) ))
  local space_length=$(( (($_page_width - $string_length) / 2) ))
  local i=1
  while [[ $i -le $space_length ]] ; do
    before_fill="$before_fill$_fill_symbol"
    after_fill="$after_fill$_fill_symbol"
    (( i += 1 ))
  done
  echo -e "$_border$before_fill$text$after_fill$_border"
}

# BEWARE: Usage of unicode characters and emojis will messed up the text alignment.
# Parameter $1 <STRING> | string to be aline left (input)
ui_message_box_text_align_left()
{
  if [ -z ${1+x} ]; then
    echo "Runtime Error : Invalid argument. 'ui_message_box_text_align_left <STRING>'" >&2
    exit 1
  fi
  local text=" $1"
  local after_fill=""
  local string_length=$(expr length "$text")
  is_even=$string_length%2;
  if [[ $is_even -ne 0 ]];
  then
      local text="$text "
      local string_length=$(expr length "$text")
  fi
  local border_width=$(expr length "$_border")
  local _page_width=$(( $_page_width - ($border_width * 2) ))
  local space_length=$(( ($_page_width - $string_length) ))
  local i=1
  while [[ $i -le $space_length ]] ; do
    after_fill="$after_fill$_fill_symbol"
    (( i += 1 ))
  done
  echo -e "$_border$text$after_fill$_border"
}

# Parameter $1 <FUNCTION_NAME> | color style for message box, Default 'style_foreground_purple'
# Parameter $2 <FUNCTION_NAME> | text alignment for message box title, Default 'ui_message_box_text_align_center'
# Parameter $3 <STRING> | string to be in message box title, Default '$APP_NAME'
# Parameter $4 <FUNCTION_NAME> | text alignment for message box content, Default 'ui_message_box_text_align_center'
# Parameter $5 <STRING> | string to be in message box content, Default ''
# Parameter $@ <STRING> | string to be in message box content, Default ''
ui_message_box()
{
  local color_style="style_foreground_purple"
  local title_alignment="ui_message_box_text_align_center"
  local title="$APP_NAME"

  if [ -z ${1+x} ]; then
    set -- "$color_style" "$title_alignment" "$title"
  fi
  #  check the first argument is style or not
  IFS='_' read -a style <<< "$1"
  if [[ "${style[0]}" != "style" ]]; then
    set -- "$color_style" "${@:1}"
  fi

  if [ -z ${2+x} ]; then
    set -- "$1" "$title_alignment" "${@:2}"
  fi
  #  check the first argument is ui or not
  IFS='_' read -a ui <<< "$2"
  if [[ "${ui[0]}" != "ui" ]]; then
    set -- "$1" "$title_alignment" "${@:2}"
  fi

  if [ -z ${3+x} ]; then
    set -- "$1" "$2" "$title" "${@:3}"
  fi

  local color_style="$1"
  local title_alignment="$2"
  local title="$3"
  set -- "${@:4}"

  $color_style "$(_ui_message_box_divider)"
  new_line
  $color_style "$(_ui_message_box_fill)"
  new_line
  $color_style "$($title_alignment "$title")"
  new_line
  if [[ ${#} -gt 0 ]]; then
    local content_alignment="ui_message_box_text_align_center"
    #  check the first argument is ui or not
    IFS='_' read -a ui <<< "$1"
    if [[ "${ui[0]}" != "ui" ]]; then
      set -- "$content_alignment" "${@:1}"
    fi
    local content_alignment="$1"
    set -- "${@:2}"
    $color_style "$(_ui_message_box_fill)"
    new_line
    $color_style "$(_ui_message_box_divider)"
    new_line
    $color_style "$(_ui_message_box_fill)"
    new_line
    for content in "$@"
      do
      $color_style "$($content_alignment "$content")"
      new_line
    done
  fi
  $color_style "$(_ui_message_box_fill)"
  new_line
  $color_style "$(_ui_message_box_divider)"
  new_line
}
