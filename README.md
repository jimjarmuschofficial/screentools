# ScreenTools

Simple screenshot and screen recording tools for Linux Mint and Ubuntu.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)

## Features

- 🖼️ **Screenshot Tool** - Press PrtScn, select area, auto-copy to clipboard AND save to file
- 🎥 **Screen Recording** - Press Alt+PrtScn to start/stop recording with audio
- 📂 **Quick Access** - Press Ctrl+PrtScn to open your screenshots folder
- 🎯 **Simple** - Works like Windows Snipping Tool
- 🔊 **Smart Audio** - Auto-captures from current output (headphones/speakers/built-in)
- ⚡ **Fast** - 3 second countdown, instant screenshot
- 📁 **Organized** - Screenshots: `~/Pictures/Screenshots/`, Recordings: `~/Videos/ScreenRecordings/`

## Quick Install (Linux Mint / Ubuntu)

### Method 1: .deb Package (Recommended)

1. Download `screentools_1.2.0_all.deb` from [Releases](https://github.com/jimjarmuschofficial/screentools/releases)
2. Double-click to install, or:
```bash
sudo dpkg -i screentools_1.2.0_all.deb
sudo apt-get install -f
```
3. Log out and back in
4. Done! PrtScn, Alt+PrtScn, and Ctrl+PrtScn now work

### Method 2: Install Script

```bash
wget https://github.com/jimjarmuschofficial/screentools/releases/download/v1.2.0/screentools-1.2.0.tar.gz
tar -xzf screentools-1.2.0.tar.gz
cd screentools-dist
./install.sh
```

## Usage

### Screenshots
- Press **PrtScn**
- Select area with crosshair (drag or click window)
- Image copied to clipboard AND saved to `~/Pictures/Screenshots/`
- Paste anywhere with Ctrl+V
- Press Esc to cancel

### Screen Recording
- Press **Alt+PrtScn** to start
- Select area with crosshair
- 3 second countdown
- Recording starts (with system audio)
- Press **Alt+PrtScn** again to stop
- Folder opens with your video

### Open Screenshots Folder
- Press **Ctrl+PrtScn**
- Your screenshots folder opens instantly
- "Control your print screens" 📂

## System Requirements

- Linux Mint 22+ or Ubuntu 24.04+
- Cinnamon, GNOME, or compatible desktop
- Dependencies (auto-installed):
  - maim
  - xclip
  - slop
  - ffmpeg
  - pulseaudio-utils

## How It Works

**Screenshot:** Uses `maim` for selection + `xclip` for clipboard  
**Recording:** Uses `slop` for selection + `ffmpeg` for recording  
**Audio:** Dynamically captures from your current audio output using PulseAudio monitors

## Manual Keyboard Setup

If auto-configuration doesn't work:

1. Open System Settings → Keyboard → Shortcuts
2. Disable default PrtScn bindings under "Screenshots"
3. Add custom shortcuts:
   - **Name:** Screenshot | **Command:** `screentools-screenshot` | **Key:** PrtScn
   - **Name:** Recording | **Command:** `screentools-record` | **Key:** Alt+PrtScn
   - **Name:** Open Screenshots | **Command:** `screentools-open-screenshots` | **Key:** Ctrl+PrtScn

## Uninstall

```bash
sudo apt remove screentools
```

## Troubleshooting

**Shortcuts don't work:**
- Log out and back in
- Check for conflicting shortcuts in System Settings
- Run `screentools-screenshot` in terminal to test

**No audio in recordings:**
- Check audio is playing during recording
- Run `pactl get-default-sink` to verify audio output detected

**Recording folder doesn't open:**
- Manually check `~/Videos/ScreenRecordings/`

## Building from Source

```bash
git clone https://github.com/jimjarmuschofficial/screentools.git
cd screentools
# Scripts are in screentools-package/usr/local/bin/
```

## Contributing

Pull requests welcome! Please test on Linux Mint/Ubuntu before submitting.

## License

MIT License - Free to use, modify, and distribute.

## Credits

Created for Linux Mint users who want Windows-style screenshot and recording tools.

Uses: maim, slop, xclip, ffmpeg, PulseAudio
