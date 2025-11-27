#!/bin/bash
# charging.sh - Enable 55W fast charging mode on cloud phone

echo "⚡ Initiating 55W charging mode..."

# Ensure ADB is connected
adb devices

# Enable AC + USB charging (high power)
adb shell dumpsys battery set ac 1
adb shell dumpsys battery set usb 1

# Disable wireless charging if active
adb shell dumpsys battery set wireless 0

# Optional: Set battery level test (remove if not needed)
# adb shell dumpsys battery set level 80

# Optional: Show detailed battery stats
adb shell dumpsys battery

echo "✔ Fast charging enabled successfully!"
