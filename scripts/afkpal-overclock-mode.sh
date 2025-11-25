#!/bin/bash
echo "🔥 AFKPal Overclock Mode – EXTREME Performance ACTIVATED"

# 1️⃣ Stop non-essential services
echo "🛑 Stopping background services..."
adb shell am kill-all
adb shell pm trim-caches 1G

# 2️⃣ Unlock CPU Max Frequency
echo "⚡ Unlocking CPU max frequency..."
for CPU in $(seq 0 $(($(adb shell nproc)-1))); do
  adb shell "echo performance | tee /sys/devices/system/cpu/cpu$CPU/cpufreq/scaling_governor"
done

# 3️⃣ GPU Overclock / Vulkan Boost
echo "🎮 Enabling GPU Max Performance..."
adb shell setprop debug.hwui.renderer opengl
adb shell setprop debug.vulkan.enable true
adb shell setprop ro.gpu.overclock 1

# 4️⃣ Display Max Refresh Rate
echo "🖥 Forcing 165Hz Display..."
adb shell settings put system peak_refresh_rate 165
adb shell settings put system min_refresh_rate 165

# 5️⃣ Input / Touch Boost
echo "⚡ Low-latency touch enabled..."
adb shell settings put system touch.response_rate 1
adb shell settings put system touch.sensitivity 3

# 6️⃣ Disable Animations
echo "🪄 Speeding up UI..."
adb shell settings put global window_animation_scale 0.0
adb shell settings put global transition_animation_scale 0.0
adb shell settings put global animator_duration_scale 0.0

# 7️⃣ Thermal Thresholds (raise limits carefully)
echo "🌡 Raising thermal limits..."
adb shell "echo 95000 > /sys/class/thermal/thermal_zone0/trip_point_0_temp"
adb shell "echo 95000 > /sys/class/thermal/thermal_zone1/trip_point_0_temp"

# 8️⃣ Enable Game Turbo / Max Network
echo "🎯 Game Turbo / Network Boost"
adb shell cmd game turbo enable
adb shell cmd game mode performance
adb shell settings put global wifi_scan_always_enabled 1
adb shell settings put global airtime_fairness_enable 0

# 9️⃣ Clear Cache for Max Memory
echo "🧹 Clearing cache for optimal RAM..."
adb shell sync
adb shell echo 3 > /proc/sys/vm/drop_caches

echo "🔥 OVERCLOCK MODE ENABLED – Use responsibly!"
