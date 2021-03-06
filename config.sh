#!/bin/bash

# min and max temp are just boundaries for the script; change them if you
# want to change the scale from Celsius to something else, or if your
# computer is likely to exceed the default values
min_temp="0"
max_temp="110"

# if tdiff_avg_or_max is:
# 0 - script will use the average of all temp deltas to decide whether the
#	script needs to update the fan speed (less computation time)
# 1 - script will re-calculate the fan speed for all GPU's if one GPU has a
#	large temp delta, which is better if you use each GPU for tasks with
#	different levels of intensity
tdiff_avg_or_max="1"

# how long the script should wait until checking for a change in temps
# the first value (default: 7) is for long idle periods
# the second value (default: 5) is if the script detects a change in temps
#	but isn't great enough to alter the fan speed
declare -a slp_times=( "7" "5" )

# by default it's set up so that when the temp is less than or equal to 35
# degrees, the fan speed will be set to 25%. next, if the temp is between 36
# and 45, the fan speed should be set to 40%, etc.
declare -a fcurve=( "25" "40" "55" "70" "85" )
declare -a tcurve=( "35" "45" "50" "55" "60" )
