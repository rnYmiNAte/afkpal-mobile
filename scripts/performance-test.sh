#!/bin/bash

echo "🎯 Performance Testing AFKPAL Cloud Phone..."

mkdir -p logs

echo "---- FPS Test ----"
adb shell dumpsys SurfaceFlinger | grep fps | tee logs/fps_log.txt

echo "---- Thermal Test ----"
adb shell cat /sys/class/thermal/thermal_zone*/temp | tee logs/thermal_log.txt

echo "---- Battery Status ----"
adb shell dumpsys battery | tee logs/battery_log.txt

echo "---- RAM Usage ----"
adb shell cat /proc/meminfo | grep -i memfree | tee logs/ram_usage.txt

echo "---- I/O Pressure ----"
adb shell iostat | tee logs/io_log.txt

echo "✔ Performance Test Completed! Logs stored in /logs."