#!/usr/bin/env python3
"""
AFK Detector – Detects inactivity on the cloud phone using ADB input events
"""

import time
import subprocess

IDLE_THRESHOLD = 180  # seconds (3 minutes before considered AFK)

def get_last_input_time():
    try:
        output = subprocess.check_output(
            "adb shell dumpsys input | grep 'DispatchingTouch' -m 1",
            shell=True
        ).decode("utf-8").strip()
        timestamp = int(output.split("=")[1])
        return timestamp
    except:
        return None

def main():
    print("[AFK Detector] Started Monitoring...")
    last_time = get_last_input_time()

    while True:
        time.sleep(10)
        new_time = get_last_input_time()

        if new_time and new_time == last_time:
            print("[AFK] No touch detected.")
            time.sleep(IDLE_THRESHOLD)

            print("[AFK] Sending fake input...")
            subprocess.call("adb shell input tap 500 1200", shell=True)
        else:
            print("[ACTIVE] User is interacting.")
            last_time = new_time

if __name__ == "__main__":
    main()
