# ScreenTools Changelog

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
