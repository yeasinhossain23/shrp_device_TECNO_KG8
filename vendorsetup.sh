#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#

export FDEVICE="neon"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	export TW_DEFAULT_LANGUAGE="en"
    export FOX_VIRTUAL_AB_DEVICE=1
    export FOX_VANILLA_BUILD=1
    export OF_USE_GREEN_LED=0
	  export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export FOX_REMOVE_AAPT=1
	  export FOX_ENABLE_APP_MANAGER=0
	  export FOX_DISABLE_APP_MANAGER=1
    export OF_FLASHLIGHT_ENABLE=0
    export FOX_USE_NANO_EDITOR=1
    export FOX_EXCLUDE_NANO_EDITOR=0
    export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
    export OF_MAINTAINER="yeasinhossain23"
    export FOX_BUILD_TYPE="OFFICIAL"
    # screen settings
    export OF_SCREEN_H := 2400
    export OF_STATUS_H := 95
    export OF_STATUS_INDENT_LEFT := 56
    export OF_STATUS_INDENT_RIGHT := 48
    export OF_ALLOW_DISABLE_NAVBAR := 0
    export OF_CLOCK_POS := 1

    export FOX_REMOVE_ZIP_BINARY=1
	  export OF_SKIP_ORANGEFOX_PROCESS=1
	

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
