#!/bin/bash
# SINNER Portfolio - Quick Start Script
# Usage: ./start.sh [port]

PORT=${1:-8080}
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "═══════════════════════════════════════════════════"
echo "  SINNER - Motorcycle Cinematic Portfolio"
echo "═══════════════════════════════════════════════════"
echo ""
echo "  Starting server..."
echo "  Port: $PORT"
echo "  Directory: $DIR"
echo ""
echo "  URLs:"
echo "  ├── Main Portfolio:  http://localhost:$PORT/"
echo "  ├── Generative Art:  http://localhost:$PORT/generative-art.html"
echo "  └── Poster:          http://localhost:$PORT/poster.html"
echo ""
echo "  Press Ctrl+C to stop"
echo "═══════════════════════════════════════════════════"
echo ""

# Check if Python is available
if command -v python3 &> /dev/null; then
    cd "$DIR"
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    cd "$DIR"
    python -m SimpleHTTPServer $PORT
elif command -v npx &> /dev/null; then
    cd "$DIR"
    npx serve -l $PORT
else
    echo "Error: No HTTP server found. Install Python or Node.js"
    exit 1
fi
