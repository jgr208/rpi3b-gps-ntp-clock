# Raspberry Pi 3 B+ - GPS NTP HDMI Clock (Armbian)

This project configures a Raspberry Pi 3 B+ running Armbian as a high-precision NTP time server using the Adafruit Ultimate GPS HAT. The clock is displayed on an HDMI screen using a fullscreen Tkinter GUI. PPS is used for microsecond time accuracy.

## Features
- ✅ Fullscreen digital clock via HDMI using Tkinter
- ✅ GPS time synchronization via `gpsd`
- ✅ PPS (Pulse Per Second) via GPIO4
- ✅ VLAN (802.1q) support
- ✅ Systemd autostart for clock on boot
- ✅ Image backup script included (`make-image.sh`)

## Hardware Setup
- **Board**: Raspberry Pi 3 B+
- **OS**: Armbian Bookworm (CLI version)
- **GPS Module**: Adafruit Ultimate GPS HAT
- **Display**: HDMI monitor

### GPIO Connections (handled by the HAT):
- TX → GPIO15 (RXD)
- RX → GPIO14 (TXD)
- PPS → GPIO4 (pin 7)

## Included Files
- `ntpclock.py`: Tkinter fullscreen clock script
- `ntpclock.service`: Systemd service to launch clock
- `ntp.conf`: Configured for GPS+PPS
- `customize-image.sh`: One-time setup script to install everything
- `armbianEnv.txt`: Enables PPS overlay on GPIO4
- `make-image.sh`: Script to create your own `.img.xz` backup
- `README.md`: This file

## Setup Instructions

### 1. Flash Armbian Bookworm to SD card
Download from https://www.armbian.com and flash using Balena Etcher or `dd`.

### 2. Apply GPIO overlay
Mount the SD card and replace `/boot/armbianEnv.txt` with the one from this repo.

### 3. Boot and run setup
SSH into the Pi or log in locally, then run:

```bash
sudo bash customize-image.sh
```

### 4. Reboot
The clock will appear on your HDMI display automatically after boot.

### 5. Optional: Create a backup image
Run:

```bash
bash make-image.sh
```

This will generate a compressed `.img.xz` you can flash on other Pis.

## License
MIT License
