#!/bin/bash
echo "📈 Starting AFKPal Live FPS Monitor..."
adb shell dumpsys SurfaceFlinger --latency-clear

while true; do
  FPS=$(adb shell dumpsys SurfaceFlinger --latency 2>/dev/null | awk 'NR==2 {print 1000000000 / $1}')
  echo "🎮 FPS: ${FPS} FPS"
  sleep 2
done
