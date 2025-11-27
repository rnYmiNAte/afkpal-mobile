#!/bin/bash
echo "Starting Charging at 55W..."
adb shell dumpsys battery set ac 1
adb shell dumpsys battery set usb 1
adb shell dumpsys battery set level 100
echo "Charging simulation active."
