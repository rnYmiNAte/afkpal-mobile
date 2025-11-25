#!/bin/bash
echo "🚀 Enabling AFKPal Performance Boost Mode..."

# 1️⃣ Unlock full CPU/GPU power
echo "⚙ Unlocking CPU/GPU Maximum Performance..."
adb shell setprop ro.performance.mode sport
adb shell setprop sys.cpufreq.boost 1
adb shell "echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"

# 2️⃣ Enable 165Hz Display Mode
echo "🖥 Forcing 165Hz Display..."
adb shell settings put system peak_refresh_rate 165
adb shell settings put system min_refresh_rate 165

# 3️⃣ GPU Optimizations
echo "🎮 GPU Rendering Mode: Vulkan / OpenGL Forced"
adb shell setprop debug.hwui.renderer opengl
adb shell setprop debug.vulkan.enable true
adb shell settings put global enable_gpu_debug_layers 1

# 4️⃣ Touch Response Boost
echo "⚡ Reducing Input Latency..."
adb shell settings put system touch.response_rate 2
adb shell settings put system touch.sensitivity 2

# 5️⃣ Network Boost (Cloud Gaming)
echo "📶 Optimizing WiFi / 4G / 5G..."
adb shell settings put global wifi_scan_always_enabled 1
adb shell settings put global airtime_fairness_enable 0

# 6️⃣ Animation Speed Boost
echo "⚡ Removing UI Delays..."
adb shell settings put global window_animation_scale 0.25
adb shell settings put global transition_animation_scale 0.25
adb shell settings put global animator_duration_scale 0.25

# 7️⃣ Game Turbo Mode
echo "🧠 Forcing Game Mode..."
adb shell cmd game turbo enable
adb shell cmd game mode performance

# 8️⃣ Clear Background Apps
echo "🧹 Clearing Background Apps..."
adb shell am kill-all
adb shell pm trim-caches 500M

echo "✔ Performance Boost Mode ENABLED!"
