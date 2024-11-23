#!/bin/bash

windows=$(yabai -m query --windows --display mouse | jq '[.[] | select(."is-visible"==true and ."is-floating"==false)] | length')

function get_display_aspect_ratio {
  display_info=$(yabai -m query --displays --display mouse)
  width=$(echo "$display_info" | jq '.frame.w')
  height=$(echo "$display_info" | jq '.frame.h')

  # Calculate the precise aspect ratio
  aspect_ratio=$(echo "$width / $height" | bc -l)

  if (( $(echo "$aspect_ratio > 2.3 && $aspect_ratio < 2.5" | bc -l) )); then
    echo "21:9"
  elif (( $(echo "$aspect_ratio > 1.7 && $aspect_ratio < 1.8" | bc -l) )); then
    echo "16:9"
  elif (( $(echo "$aspect_ratio > 1.5 && $aspect_ratio < 1.6" | bc -l) )); then
    echo "16:10"
  elif (( $(echo "$aspect_ratio > 3.4 && $aspect_ratio < 3.6" | bc -l) )); then
    echo "32:9"
  else
    echo "something:whacky"
  fi
}

# echo "Detected display: $(yabai -m query --displays --display mouse | jq '.frame')"
# echo "Aspect ratio: $(get_display_aspect_ratio)"
#
aspect_ratio=$(get_display_aspect_ratio)
# echo "Aspect ratio detected: $aspect_ratio"

if [[ $aspect_ratio == "21:9" || $aspect_ratio == "32:9" ]]; then
  if [[ $windows == 1 ]]; then
    yabai -m space --padding abs:0:0:700:700
  else
    yabai -m space --padding abs:0:0:2:2
  fi
fi
