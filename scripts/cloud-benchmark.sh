#!/bin/bash

echo "📊 Running Cloud Phone Benchmark..."

mkdir -p logs

# CPU Info
echo "---- CPU Info ----"
adb shell cat /proc/cpuinfo | grep 'Hardware' | tee logs/cpu_log.txt

# RAM Check
echo "---- RAM Info ----"
adb shell cat /proc/meminfo | grep MemTotal | tee logs/ram_log.txt

# ROM (Storage) Check
echo "---- ROM/Storage Info ----"
adb shell df -h | grep /data | tee logs/storage_log.txt

# GPU Check
echo "---- GPU Info ----"
adb shell dumpsys SurfaceFlinger | grep GLES | tee logs/gpu_log.txt

# Storage Size Check
STORAGE=$(adb shell df -h /data | awk 'NR==2 {print $2}' | sed 's/G//')
if [ ${STORAGE%.*} -ge 900 ]; then
  echo "✔ ROM is 1 TB (OK)" | tee -a logs/storage_log.txt
else
  echo "❌ ROM < 1 TB - Warning issued!" | tee -a logs/storage_log.txt
fi

echo "✔ Benchmark complete. Logs saved to /logs"