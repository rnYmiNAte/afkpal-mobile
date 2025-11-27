#!/bin/bash
# Script: Battery Charging Control

echo "Starting charging control..."
bash scripts/charger/55w_charger.sh
bash scripts/charger/5v_charger.sh
echo "Battery charging sequence complete."
