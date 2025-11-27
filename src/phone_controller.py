#!/usr/bin/env python3
"""
Phone Controller – Controls boot, restart, and app manipulation
"""

import subprocess

def boot_phone():
    subprocess.call("adb start-server", shell=True)
    print("Phone booted & ADB started.")

def restart_phone():
    subprocess.call("adb reboot", shell=True)
    print("Phone restarting...")

def open_app(package_name):
    cmd = f"adb shell monkey -p {package_name} -c android.intent.category.LAUNCHER 1"
    subprocess.call(cmd, shell=True)
    print(f"{package_name} launched.")

def close_app(package_name):
    cmd = f"adb shell am force-stop {package_name}"
    subprocess.call(cmd, shell=True)
    print(f"{package_name} closed.")

if __name__ == "__main__":
    boot_phone()
