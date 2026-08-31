#!/bin/bash
# Morny Password Kit - Installer
# Author: Philip Morny

echo "🔐 Morny Password Kit - Installer"
echo "=================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    echo -e "${RED}Please do not run as root${NC}"
    exit 1
fi

echo -e "${GREEN}[1/5] Checking Python...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Python3 not found. Installing...${NC}"
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip
fi

echo -e "${GREEN}[2/5] Installing dependencies...${NC}"
pip3 install -r requirements.txt

echo -e "${GREEN}[3/5] Setting up directories...${NC}"
mkdir -p templates
mkdir -p logs

echo -e "${GREEN}[4/5] Making scripts executable...${NC}"
chmod +x app.py
chmod +x run_morny_password.sh

echo -e "${GREEN}[5/5] Creating desktop launcher...${NC}"
cat > ~/Desktop/morny-password.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Morny Password Kit
Comment=Advanced Password Strength Checker
Exec=$PWD/run_morny_password.sh
Icon=$PWD/icon.png
Terminal=true
Categories=Utility;Security;
StartupNotify=true
EOF
chmod +x ~/Desktop/morny-password.desktop

echo ""
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo ""
echo "📱 To run:"
echo "   ./run_morny_password.sh"
echo "   or click the desktop icon"
echo "   or type 'morny' (if alias was set)"
echo ""
echo "📍 Web Interface: http://localhost:5000"
