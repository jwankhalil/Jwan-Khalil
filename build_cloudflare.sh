#!/usr/bin/env bash
set -euo pipefail

# Install Flutter (stable) on the Cloudflare build machine
FLUTTER_DIR="$HOME/flutter-sdk"

if [ ! -d "$FLUTTER_DIR" ]; then
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$FLUTTER_DIR"
fi

export PATH="$PATH:$FLUTTER_DIR/bin"
flutter config --no-analytics
flutter config --enable-web
flutter pub get
flutter build web --release --no-wasm-dry-run
