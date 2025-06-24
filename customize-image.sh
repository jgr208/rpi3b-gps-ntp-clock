#!/bin/bash
echo "[*] Installing GPS + NTP HDMI Clock for Armbian Pi 3 B+]"

apt update
apt install -y gpsd gpsd-clients ntp pps-tools python3-tk

# Copy scripts
mkdir -p /usr/local/bin
cp /root/ntpclock.py /usr/local/bin/
chmod +x /usr/local/bin/ntpclock.py

# Enable systemd clock
cp /root/ntpclock.service /etc/systemd/system/
systemctl enable ntpclock

# Load 8021q for VLAN support
echo 8021q >> /etc/modules

echo "[*] Setup complete. Reboot to activate HDMI clock and GPS."
