#!/bin/bash

# BEWARE: There are some differences between colors when combining colors with bold text attribute:
#         By default bold text has set foreground color to white

# BEWARE: Below functions can't be use correctly with other string formatters 
#         (like style_italic, style_underline, etc...), since it override text to bold by default.
#
#         style_foreground_blue_bold
#         style_foreground_brown_bold
#         style_foreground_cyan_bold
#         style_foreground_gray_bold
#         style_foreground_green_bold
#         style_foreground_purple_bold
#         style_foreground_red_bold
#         style_foreground_white
#
#         style_background_blue_bold
#         style_background_brown_bold
#         style_background_cyan_bold
#         style_background_gray_bold
#         style_background_green_bold
#         style_background_purple_bold
#         style_background_red_bold
#         style_background_white

#  Text Formatting -----------------------------------------------------------------------------------------------------

# Set string to normal characters
# Parameter $1 string to be formatted (input)
style_normal()
{
  echo -n -e "\033[0m$1\033[0m"
}

# Set string to bold characters
# Parameter $1 string to be formatted (input)
style_bold()
{
  echo -n -e "\033[0;1m$1\033[0m"
}

# TODO: \033[0;2m unknown character formatting

# Set string to italic characters
# Parameter $1 string to be formatted (input)
style_italic()
{
  echo -n -e "\033[0;3m$1\033[0m"
}

# Set string to underline characters
# Parameter $1 string to be formatted (input)
style_underline()
{
  echo -n -e "\033[0;4m$1\033[0m"
}

# Set string to blinking characters
# Parameter $1 string to be formatted (input)
style_blinking()
{
  echo -n -e "\033[0;5m$1\033[0m"
}

# TODO: \033[0;6m unknown character formatting

# Set string to reverse video characters
# Parameter $1 string to be formatted (input)
style_reverse_video()
{
  echo -n -e "\033[0;7m$1\033[0m"
}

#  Colors | Foreground -------------------------------------------------------------------------------------------------

# Set string foreground color to black
# Parameter $1 string to be formatted (input)
style_foreground_black()
{
  echo -n -e "\033[0;30m$1\033[0m"
}

# Set string foreground color to blue
# Parameter $1 string to be formatted (input)
style_foreground_blue()
{
  echo -n -e "\033[0;34m$1\033[0m"
}

# Set string foreground color to blue with bold
# Parameter $1 string to be formatted (input)
style_foreground_blue_bold()
{
  echo -n -e "\033[1;34m$1\033[0m"
}

# Set string foreground color to brown
# Parameter $1 string to be formatted (input)
style_foreground_brown()
{
  echo -n -e "\033[0;33m$1\033[0m"
}

# Set string foreground color to yellow
# Parameter $1 string to be formatted (input)
style_foreground_brown_bold()
{
  echo -n -e "\033[1;33m$1\033[0m"
}

# Set string foreground color to cyan
# Parameter $1 string to be formatted (input)
style_foreground_cyan()
{
  echo -n -e "\033[0;36m$1\033[0m"
}

# Set string foreground color to cyan with bold
# Parameter $1 string to be formatted (input)
style_foreground_cyan_bold()
{
  echo -n -e "\033[1;36m$1\033[0m"
}

# Set string foreground color to gray
# Parameter $1 string to be formatted (input)
style_foreground_gray()
{
  echo -n -e "\033[0;37m$1\033[0m"
}

# Set string foreground color to gray with bold
# Parameter $1 string to be formatted (input)
style_foreground_gray_bold()
{
  echo -n -e "\033[1;30m$1\033[0m"
}

# Set string foreground color to green
# Parameter $1 string to be formatted (input)
style_foreground_green()
{
  echo -n -e "\033[0;32m$1\033[0m"
}

# Set string foreground color to green with bold
# Parameter $1 string to be formatted (input)
style_foreground_green_bold()
{
  echo -n -e "\033[1;32m$1\033[0m"
}

# Set string foreground color to purple
# Parameter $1 string to be formatted (input)
style_foreground_purple()
{
  echo -n -e "\033[0;35m$1\033[0m"
}

# Set string foreground color to  purple with bold
# Parameter $1 string to be formatted (input)
style_foreground_purple_bold()
{
  echo -n -e "\033[1;35m$1\033[0m"
}

# Set string foreground color to red
# Parameter $1 string to be formatted (input)
style_foreground_red()
{
  echo -n -e "\033[0;31m$1\033[0m"
}

# Set string foreground color to red with bold
# Parameter $1 string to be formatted (input)
style_foreground_red_bold()
{
  echo -n -e "\033[1;31m$1\033[0m"
}

# Set string foreground color to white
# Parameter $1 string to be formatted (input)
style_foreground_white()
{
  echo -n -e "\033[1;37m$1\033[0m"
}

#  Colors | Background -------------------------------------------------------------------------------------------------

# Set string background color to black
# Parameter $1 string to be formatted (input)
style_background_black()
{
  echo -n -e "\033[0;37m\033[0;40m$1\033[0m"
}

# Set string background color to blue
# Parameter $1 string to be formatted (input)
style_background_blue()
{
  echo -n -e "\033[0;37m\033[0;44m$1\033[0m"
}

# Set string background color to blue and bold
# Parameter $1 string to be formatted (input)
style_background_blue_bold()
{
  echo -n -e "\033[0;37m\033[1;44m$1\033[0m"
}

# Set string background color to brown
# Parameter $1 string to be formatted (input)
style_background_brown()
{
  echo -n -e "\033[0;37m\033[0;43m$1\033[0m"
}

# Set string background color to brown and bold
# Parameter $1 string to be formatted (input)
style_background_brown_bold()
{
  echo -n -e "\033[0;37m\033[1;43m$1\033[0m"
}

# Set string background color to cyan
# Parameter $1 string to be formatted (input)
style_background_cyan()
{
  echo -n -e "\033[0;37m\033[0;46m$1\033[0m"
}

# Set string background color to cyan  and bold
# Parameter $1 string to be formatted (input)
style_background_cyan_bold()
{
  echo -n -e "\033[0;37m\033[1;46m$1\033[0m"
}

# Set string background color to gray
# Parameter $1 string to be formatted (input)
style_background_gray()
{
  echo -n -e "\033[0;30m\033[0;47m$1\033[0m"
}

# Set string background color to gray  and bold
# Parameter $1 string to be formatted (input)
style_background_gray_bold()
{
  echo -n -e "\033[0;37m\033[1;40m$1\033[0m"
}

# Set string background color to green
# Parameter $1 string to be formatted (input)
style_background_green()
{
  echo -n -e "\033[0;37m\033[0;42m$1\033[0m"
}

# Set string background color to green  and bold
# Parameter $1 string to be formatted (input)
style_background_green_bold()
{
  echo -n -e "\033[0;37m\033[1;42m$1\033[0m"
}

# Set string background color to purple
# Parameter $1 string to be formatted (input)
style_background_purple()
{
  echo -n -e "\033[0;37m\033[0;45m$1\033[0m"
}

# Set string background color to purple  and bold
# Parameter $1 string to be formatted (input)
style_background_purple_bold()
{
  echo -n -e "\033[0;37m\033[1;45m$1\033[0m"
}

# Set string background color to red
# Parameter $1 string to be formatted (input)
style_background_red()
{
  echo -n -e "\033[0;37m\033[0;41m$1\033[0m"
}

# Set string background color to red  and bold
# Parameter $1 string to be formatted (input)
style_background_red_bold()
{
  echo -n -e "\033[0;37m\033[1;41m$1\033[0m"
}

# Set string background color to white
# Parameter $1 string to be formatted (input)
style_background_white()
{
  echo -n -e "\033[0;30m\033[1;47m$1\033[0m"
}
