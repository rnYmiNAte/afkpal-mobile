#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 --capacity-mAh <int> --power-W <float> --voltage-V <float> --session-id <id>"
  exit 2
}

CAPACITY_MAH=""
POWER_W=""
VOLTAGE_V=""
SESSION_ID=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --capacity-mAh) CAPACITY_MAH="$2"; shift 2 ;;
    --power-W) POWER_W="$2"; shift 2 ;;
    --voltage-V) VOLTAGE_V="$2"; shift 2 ;;
    --session-id) SESSION_ID="$2"; shift 2 ;;
    *) usage ;;
  esac
done

[[ -n "$CAPACITY_MAH" && -n "$POWER_W" && -n "$VOLTAGE_V" ]] || usage

CAPACITY_AH=$(python3 - <<PY
from decimal import Decimal as D
print((D("$CAPACITY_MAH")/D("1000")))
PY
)

ENERGY_WH=$(python3 - <<PY
from decimal import Decimal as D
cap_ah = D("$CAPACITY_AH")
volt = D("$VOLTAGE_V")
print(cap_ah * volt)
PY
)

echo "Capacity: ${CAPACITY_MAH} mAh"
echo "Nominal voltage: ${VOLTAGE_V} V"
echo "Energy: ${ENERGY_WH} Wh"
echo "Fast-charge power: ${POWER_W} W"

echo "Querying battery state..."
adb shell dumpsys battery > battery_before.txt
cat battery_before.txt

# Begin charge monitoring: sample every 60 s for 20 min
echo "Sampling battery for 20 minutes..."
START_TS=$(date +%s)
for i in $(seq 1 20); do
  adb shell dumpsys battery | tee "battery_sample_$i.txt"
  sleep 60
done
END_TS=$(date +%s)
DURATION_MIN=$(( (END_TS - START_TS) / 60 ))
echo "Duration: ${DURATION_MIN} min"

# Rough health check: ensure level increases
LEVEL_BEFORE=$(grep -m1 "level" battery_before.txt | awk '{print $2}')
LEVEL_AFTER=$(adb shell dumpsys battery | grep -m1 "level" | awk '{print $2}')
echo "Battery level delta: $((LEVEL_AFTER - LEVEL_BEFORE)) %"
if [[ $LEVEL_AFTER -le $LEVEL_BEFORE ]]; then
  echo "Battery did not increase level; failing."
  exit 1
fi

echo "Charging monitoring completed."
