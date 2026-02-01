# ScreenTools Changelog

## v1.2.3 - 2026-01-31

### Added
- 📂 **Ctrl+PrtScn** - Opens screenshots folder ("Control your print screens!")
- Third shortcut added back based on user feedback

### Features
- PrtScn → Screenshot (save + clipboard)
- Alt+PrtScn → Recording
- Ctrl+PrtScn → Open screenshots folder

All three shortcuts configure automatically on first login.

---

## v1.2.2 - 2026-01-31

### Changed
- 🎯 **Truly automatic setup** - Shortcuts now configure automatically on first login after install
- Uses XDG autostart to run setup as the user (not during package installation)
- No manual `screentools-setup` command needed (but still available as fallback)
- Setup only runs once, then disables itself

### How It Works
1. Install the .deb
2. Log out and back in
3. Shortcuts configured automatically!

### Technical
- Added `/etc/xdg/autostart/screentools-setup.desktop` for automatic first-run
- New `screentools-first-run` script runs on login, configures shortcuts, then creates flag file
- Disables conflicting default Cinnamon screenshot shortcuts
- Manual `screentools-setup` still available as fallback

---

## v1.2.1 - 2026-01-31

### Added
- 💾 **Auto-save screenshots** - Screenshots now save to `~/Pictures/Screenshots/` with timestamps
- 🔧 **Setup script** - Run `screentools-setup` after install for reliable shortcut configuration
- Screenshots still copied to clipboard

### Changed
- Added user-run setup script instead of unreliable automatic configuration
- Screenshot notifications now show the file path

### Technical
- Screenshots saved as: `screenshot-YYYYMMDD-HHMMSS.png`
- New `screentools-setup` command for keyboard shortcut configuration

---

## v1.0.0 - 2026-01-29

### Added
- Initial release
- Screenshot tool (PrtScn) - Select area and copy to clipboard
- Screen recording tool (Alt+PrtScn) - Record with system audio
- Automatic keyboard shortcut configuration for Linux Mint/Cinnamon
- Dynamic audio capture from current output device
- 3 second countdown for recordings
- Auto-open recordings folder when done

## v1.2.0 - 2026-01-31

### Added
- 💾 **Auto-save screenshots** - Screenshots are now saved to `~/Pictures/Screenshots/` with timestamps
- 📂 **Ctrl+PrtScn shortcut** - Quickly open your screenshots folder ("Control your print screens!")
- Screenshots still copied to clipboard as before

### Changed
- Screenshot notifications now show the file path
- Updated description to reflect three keyboard shortcuts

### Technical
- Screenshots saved as: `screenshot-YYYYMMDD-HHMMSS.png`
- New `screentools-open-screenshots` command

---

## v1.0.0 - 2026-01-29

### Added
- Initial release
- Screenshot tool (PrtScn) - Select area and copy to clipboard
- Screen recording tool (Alt+PrtScn) - Record with system audio
- Automatic keyboard shortcut configuration for Linux Mint/Cinnamon
- Dynamic audio capture from current output device
- 3 second countdown for recordings
- Auto-open recordings folder when done
