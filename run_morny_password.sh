#!/bin/bash
# Morny Password Kit Launcher
# Author: Philip Morny

echo "🔐 Morny Password Kit - Launcher"
echo "================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 is not installed. Please install Python3."
    exit 1
fi

# Check if requirements are installed
if ! python3 -c "import flask" &> /dev/null; then
    echo "⚠️  Flask not found. Installing dependencies..."
    pip3 install -r requirements.txt
fi

# Create templates folder if missing
if [ ! -d "templates" ]; then
    echo "📁 Creating templates folder..."
    mkdir -p templates
fi

# Check if index.html exists
if [ ! -f "templates/index.html" ]; then
    echo "❌ templates/index.html not found!"
    echo "Please ensure the HTML file is in the templates folder."
    exit 1
fi

echo "✅ All checks passed!"
echo ""
echo "📱 Starting Morny Password Kit..."
echo "📍 Web Interface: http://localhost:5000"
echo "🔑 Press Ctrl+C to stop"
echo ""

# Run the application
python3 app.py
