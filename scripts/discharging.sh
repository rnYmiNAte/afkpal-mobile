#!/bin/bash
# discharging.sh - Discharge battery safely

echo "🔋 Starting battery discharging process..."

# Reset charging status (simulate discharging)
adb shell dumpsys battery set ac 0
adb shell dumpsys battery set usb 0
adb shell dumpsys battery set wireless 0

# Optional: Set battery level for test
# adb shell dumpsys battery set level 20

# Show battery stats
adb shell dumpsys battery

echo "✔ Battery discharging mode enabled!"
