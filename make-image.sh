#!/bin/bash
echo "[*] Creating image backup..."

OUTPUT=~/rpi3b-gps-clock.img

# Be sure you're not running this while booted from the SD card if using this from another system
sudo dd if=/dev/mmcblk0 of=$OUTPUT bs=4M status=progress
sync
xz -T0 $OUTPUT

echo "[*] Done. Output: $OUTPUT.xz"
