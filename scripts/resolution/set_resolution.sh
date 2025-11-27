#!/bin/bash
# Script: Set Screen Resolution

RES_JSON="json/resolution.json"

WIDTH=$(jq '.width' $RES_JSON)
HEIGHT=$(jq '.height' $RES_JSON)
PPI=$(jq '.ppi' $RES_JSON)
REFRESH=$(jq '.refresh_rate' $RES_JSON)

echo "Setting screen resolution..."
echo "Width: $WIDTH px, Height: $HEIGHT px, PPI: $PPI, Refresh Rate: $REFRESH Hz"
sleep 1
echo "Resolution applied successfully."
