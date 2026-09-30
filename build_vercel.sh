#!/usr/bin/env bash
set -euo pipefail

# Install Flutter (stable) on the Vercel build machine
if [ ! -d "flutter-sdk" ]; then
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable flutter-sdk
fi

export PATH="$PATH:$(pwd)/flutter-sdk/bin"
flutter config --no-analytics
flutter config --enable-web
flutter doctor
flutter pub get
flutter build web --release --no-wasm-dry-run
