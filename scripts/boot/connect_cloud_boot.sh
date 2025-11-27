#!/bin/bash
# Script: Connect Cloud Phone and Boot

echo "Starting cloud phone boot sequence..."
sleep 2
echo "Connecting cloud phone to boot service..."
sleep 1
echo "Initializing OS..."
bash scripts/os/android16_baklava.sh
echo "Cloud phone boot sequence completed!"
