#!/usr/bin/env python3
import subprocess
import json
import os

# Paths
JSON_DIR = "json"
SCRIPTS_DIR = "scripts"

RESOLUTION_JSON = os.path.join(JSON_DIR, "resolution.json")
ROM_JSON = os.path.join(JSON_DIR, "rom_specs.json")
BATTERY_JSON = os.path.join(JSON_DIR, "battery_capacity.json")
OS_JSON = os.path.join(JSON_DIR, "os.json")

# Helper functions
def run_script(script_path):
    """Run a bash script and print output."""
    if os.path.exists(script_path):
        print(f"Running script: {script_path}")
        subprocess.run(["bash", script_path])
    else:
        print(f"Script not found: {script_path}")

def load_json(file_path):
    """Load JSON data."""
    with open(file_path, "r") as f:
        return json.load(f)

# Controller functions
def boot_phone():
    print("\n=== Booting Cloud Phone ===")
    run_script(os.path.join(SCRIPTS_DIR, "boot", "connect_cloud_boot.sh"))

def initialize_os():
    print("\n=== Initializing OS ===")
    run_script(os.path.join(SCRIPTS_DIR, "os", "android16_baklava.sh"))

def control_charging():
    print("\n=== Charging Control ===")
    run_script(os.path.join(SCRIPTS_DIR, "battery", "charging_control.sh"))

def control_discharging():
    print("\n=== Discharging Control ===")
    run_script(os.path.join(SCRIPTS_DIR, "battery", "discharging_control.sh"))

def cpu_gpu_control():
    print("\n=== CPU/GPU Control ===")
    run_script(os.path.join(SCRIPTS_DIR, "cpu_gpu", "snapdragon8elite.sh"))

def set_screen_resolution():
    print("\n=== Setting Screen Resolution ===")
    run_script(os.path.join(SCRIPTS_DIR, "resolution", "set_resolution.sh"))

def battery_status():
    battery = load_json(BATTERY_JSON)
    print(f"Battery Capacity: {battery.get('capacity_mAh')} mAh")
    print(f"Charging Status: {battery.get('charging_status')}")

def phone_summary():
    rom = load_json(ROM_JSON)
    os_data = load_json(OS_JSON)
    print("\n=== Phone Summary ===")
    print(f"OS: {os_data.get('os_name')} {os_data.get('os_code_name')} ({os_data.get('version')})")
    print(f"CPU: {rom.get('cpu')}, GPU: {rom.get('gpu')}")
    print(f"RAM: {rom.get('ram')}, ROM: {rom.get('rom_capacity')}")

# Main controller
if __name__ == "__main__":
    phone_summary()
    boot_phone()
    initialize_os()
    set_screen_resolution()
    cpu_gpu_control()
    battery_status()
    control_charging()
    control_discharging()
    battery_status()
    print("\n=== Cloud Phone Simulation Complete ===")
