# ScreenTools

Simple screenshot and screen recording tools for Linux Mint / Ubuntu.

## Features

- **Screenshot Tool** (PrtScn): Select area and copy to clipboard
- **Screen Recording** (Alt+PrtScn): Record screen area with audio

## Installation

### From .deb package:
```bash
sudo dpkg -i screentools_1.0.0_all.deb
sudo apt-get install -f  # Install dependencies if needed
```

### Manual Setup:

**Dependencies:**
```bash
sudo apt install maim xclip slop ffmpeg pulseaudio-utils libnotify-bin
```

**Install scripts:**
```bash
sudo cp screentools-screenshot /usr/local/bin/
sudo cp screentools-record /usr/local/bin/
sudo chmod +x /usr/local/bin/screentools-*
```

**Set up keyboard shortcuts:**

1. Open System Settings → Keyboard → Shortcuts
2. Go to 'Screenshots' and disable default PrtScn bindings
3. Go to 'Custom Shortcuts' and add:

   **Screenshot:**
   - Name: Screenshot to Clipboard
   - Command: `screentools-screenshot`
   - Binding: PrtScn

   **Screen Recording:**
   - Name: Record Screen Area
   - Command: `screentools-record`
   - Binding: Alt+PrtScn

## Usage

### Screenshots
1. Press **PrtScn**
2. Crosshair appears - click a window or drag to select area
3. Screenshot copied to clipboard
4. Paste with Ctrl+V

### Screen Recording
1. Press **Alt+PrtScn**
2. Crosshair appears - select area
3. 3-2-1 countdown
4. Recording starts (captures system audio from current output)
5. Press **Alt+PrtScn** again to stop
6. Video saved to `~/Videos/ScreenRecordings/`
7. Folder opens automatically

**Cancel:** Press Esc during selection

## Notes

- Videos saved as MP4 with timestamp filenames (Example: `recording-20260129-143022.mp4`)
- Vibe-coded slop cobbled together by Claude because no current screenshot tools were as intuitive as microsoft's snipping tool

## Uninstall

```bash
sudo apt remove screentools
```

## License

Free to use and modify.
