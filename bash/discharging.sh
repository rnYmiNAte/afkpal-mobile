#!/bin/bash
echo "Discharging Mode..."
adb shell dumpsys battery set ac 0
adb shell dumpsys battery set usb 0
adb shell dumpsys battery set level 45
echo "Battery now discharging."
