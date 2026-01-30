#!/bin/bash
# ScreenTools Automated Installer Script

set -e

echo "==================================="
echo "  ScreenTools Installer"
echo "==================================="
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    echo "Please run without sudo. This script will ask for password when needed."
    exit 1
fi

# Check dependencies
echo "Checking dependencies..."
MISSING=""
for cmd in maim xclip slop ffmpeg pactl notify-send; do
    if ! command -v $cmd &> /dev/null; then
        MISSING="$MISSING $cmd"
    fi
done

if [ -n "$MISSING" ]; then
    echo "Missing dependencies:$MISSING"
    echo ""
    echo "Installing dependencies..."
    sudo apt update
    sudo apt install -y maim xclip slop ffmpeg pulseaudio-utils libnotify-bin
else
    echo "✓ All dependencies installed"
fi

echo ""
echo "Installing ScreenTools..."

# Copy scripts
sudo cp screentools-screenshot /usr/local/bin/
sudo cp screentools-record /usr/local/bin/
sudo chmod +x /usr/local/bin/screentools-screenshot
sudo chmod +x /usr/local/bin/screentools-record

echo "✓ Scripts installed to /usr/local/bin/"
echo ""

# Detect desktop environment
DE="unknown"
if [ "$XDG_CURRENT_DESKTOP" = "X-Cinnamon" ]; then
    DE="cinnamon"
elif [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    DE="gnome"
fi

echo "Detected desktop environment: $DE"
echo ""

if [ "$DE" = "cinnamon" ]; then
    echo "Setting up keyboard shortcuts automatically..."
    
    # Get list of existing custom keybindings
    EXISTING_BINDINGS=$(gsettings get org.cinnamon.desktop.keybindings custom-list 2>/dev/null || echo "[]")
    
    # Add our custom bindings to the list if they don't exist
    if ! echo "$EXISTING_BINDINGS" | grep -q "screentools-screenshot"; then
        # Generate unique IDs
        SCREENSHOT_ID="custom-screentools-screenshot-$(date +%s)"
        RECORD_ID="custom-screentools-record-$(date +%s)"
        
        # Add to custom-list
        NEW_BINDINGS=$(echo "$EXISTING_BINDINGS" | sed "s/]$/, '$SCREENSHOT_ID', '$RECORD_ID']/")
        gsettings set org.cinnamon.desktop.keybindings custom-list "$NEW_BINDINGS"
        
        # Configure screenshot shortcut
        gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/$SCREENSHOT_ID/ name "ScreenTools Screenshot"
        gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/$SCREENSHOT_ID/ command "screentools-screenshot"
        gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/$SCREENSHOT_ID/ binding "['Print']"
        
        # Configure recording shortcut
        gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/$RECORD_ID/ name "ScreenTools Recording"
        gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/$RECORD_ID/ command "screentools-record"
        gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/$RECORD_ID/ binding "['<Alt>Print']"
        
        echo "✓ Keyboard shortcuts configured automatically!"
        echo ""
        echo "Note: You may need to disable conflicting default screenshot shortcuts."
        echo "Go to: System Settings → Keyboard → Shortcuts → Screenshots"
        echo "       and disable any existing PrtScn bindings."
    else
        echo "✓ Keyboard shortcuts already configured"
    fi
else
    echo "Manual keyboard shortcut setup required."
    echo ""
    echo "Steps:"
    echo "1. Open System Settings → Keyboard → Shortcuts"
    echo "2. Go to 'Screenshots' and disable default PrtScn bindings"
    echo "3. Go to 'Custom Shortcuts' and add these two:"
    echo ""
    echo "   Screenshot:"
    echo "   - Name: Screenshot to Clipboard"
    echo "   - Command: screentools-screenshot"
    echo "   - Binding: PrtScn"
    echo ""
    echo "   Screen Recording:"
    echo "   - Name: Record Screen Area"
    echo "   - Command: screentools-record"
    echo "   - Binding: Alt+PrtScn"
    echo ""
fi

echo ""
echo "==================================="
echo "  Installation Complete!"
echo "==================================="
echo ""
echo "Usage:"
echo "  PrtScn          = Screenshot area to clipboard"
echo "  Alt+PrtScn      = Start/stop screen recording"
echo "  Recordings      = ~/Videos/ScreenRecordings/"
echo ""
echo "You may need to log out and back in for shortcuts to work."
echo ""
