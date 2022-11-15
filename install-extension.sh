#!/bin/bash
#
# Installs the extension to the Gnome extensions folder.
#
# Usage:
# bazel build :install-extension
# ./bazel-bin/install-extension

set -e # exit on error

BASEDIR=$(dirname "$0")
EXTDIR="$HOME/.local/share/gnome-shell/extensions/gSnap-extended@mechakdotdev"
UPDATEDIR="$HOME/.local/share/gnome-shell/extension-updates/gSnap-extended@mechakdotdev"

if [ -d "$EXTDIR" ]; then
    # If $EXTDIR exists...
    echo "$EXTDIR exists, deleting "
    rm -R -f "$EXTDIR"
fi
if [ -d "$UPDATEDIR" ]; then
    # If $EXTDIR exists...
    echo "$UPDATEDIR exists from a queued update, deleting "
    rm -R -f "$UPDATEDIR"
fi
echo "Running in $BASEDIR"
mkdir -p "$EXTDIR"
cp -r $BASEDIR/dist/* "$HOME/.local/share/gnome-shell/extensions/gSnap-extended@mechakdotdev"

echo "Installation complete."
echo ""
echo "If developing, use Alt + F2, r [ENTER] to restart the gnome-shell and pick up changes."
