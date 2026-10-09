#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

APP_NAME="OceanaLauncher"
BUILD_DIR="build"
DIST_DIR="dist"
DMG_NAME="${APP_NAME}-macOS.dmg"

echo "🧹 Cleaning previous builds..."
rm -rf $BUILD_DIR $DIST_DIR

echo "🏗️ Building application..."
# Replace 'npm run build' with the build command specified in your package.json/project config
# If using Electron/Node.js:
# npm install
# npm run package

# Force Ad-Hoc signing so macOS allows it to be manually bypassed
echo "🔏 Applying Ad-Hoc Code Signature..."
if [ -d "$BUILD_DIR/$APP_NAME.app" ]; then
    codesign --force --deep --sign - "$BUILD_DIR/$APP_NAME.app"
else
    echo "❌ Error: $APP_NAME.app not found in $BUILD_DIR"
    exit 1
fi

echo "📦 Packaging into DMG..."
mkdir -p $DIST_DIR
hdiutil create -volname "$APP_NAME" -srcfolder "$BUILD_DIR/$APP_NAME.app" -ov -format UDZO "$DIST_DIR/$DMG_NAME"

echo "✅ DMG Build complete: $DIST_DIR/$DMG_NAME"
