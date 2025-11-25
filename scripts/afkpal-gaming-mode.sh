#!/bin/bash
echo "🎯 AFKPal Gaming Mode – Optimized for Cloud Streaming"

# 1️⃣ Boost CPU / GPU for gaming (safe overclock)
echo "⚡ CPU/GPU Boost..."
for CPU in $(seq 0 $(($(adb shell nproc)-1))); do
  adb shell "echo performance | tee /sys/devices/system/cpu/cpu$CPU/cpufreq/scaling_governor"
done
adb shell setprop debug.hwui.renderer opengl
adb shell setprop debug.vulkan.enable true

# 2️⃣ Force Display Refresh Rate
echo "🖥 Enabling 165Hz Display for smooth gameplay..."
adb shell settings put system peak_refresh_rate 165
adb shell settings put system min_refresh_rate 165

# 3️⃣ Reduce Input Latency
echo "⚡ Low-latency touch..."
adb shell settings put system touch.response_rate 1
adb shell settings put system touch.sensitivity 3

# 4️⃣ Disable animations for performance
echo "🪄 Disabling UI animations..."
adb shell settings put global window_animation_scale 0.0
adb shell settings put global transition_animation_scale 0.0
adb shell settings put global animator_duration_scale 0.0

# 5️⃣ Game Turbo / Network Optimizations
echo "🎮 Game Turbo & Network Boost..."
adb shell cmd game turbo enable
adb shell cmd game mode performance
adb shell settings put global wifi_scan_always_enabled 1
adb shell settings put global airtime_fairness_enable 0

# 6️⃣ Clear Memory / Cache
echo "🧹 Clearing RAM & cache..."
adb shell sync
adb shell echo 3 > /proc/sys/vm/drop_caches

# 7️⃣ Start FPS Monitor in background
echo "📈 Starting FPS Monitor..."
nohup bash fps-monitor.sh &

# 8️⃣ Battery Safety Check
BATTERY=$(adb shell dumpsys battery | grep level | awk '{print $2}')
if [ $BATTERY -lt 35 ]; then
  echo "⚠ Battery Low ($BATTERY%) – Enabling Power Saver for safety"
  adb shell settings put global low_power 1
else
  echo "✔ Battery OK ($BATTERY%)"
fi

echo "✔ AFKPal Gaming Mode ENABLED – Ready to stream!"
