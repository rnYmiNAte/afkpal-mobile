#!/usr/bin/env python3
"""
Battery Monitor – Reads charging/discharging state & level
"""

import subprocess
import time

def get_battery_info():
    output = subprocess.check_output(
        "adb shell dumpsys battery", shell=True
    ).decode("utf-8")
    return output

def extract_battery_level(output):
    for line in output.splitlines():
        if "level" in line:
            return int(line.split(":")[1].strip())
    return None

def main():
    print("[Battery Monitor] Starting Monitoring...")
    
    while True:
        info = get_battery_info()
        level = extract_battery_level(info)

        print(f"[Battery] Level: {level}%")
        time.sleep(20)

if __name__ == "__main__":
    main()
