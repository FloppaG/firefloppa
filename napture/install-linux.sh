#!/usr/bin/env bash

./scripts/git-status-check.sh
./scripts/deps-install.sh

echo "Building Fire Floof..."

# Build Fire Floppa
cargo build --release || exit 1

echo "Installing Fire Floof..."

# Copy files
sudo install -Dm755 ./target/release/webx /usr/bin/napture
sudo install -Dm644 ./io.github.floppag.ff.metainfo.xml -t /usr/share/metainfo/
sudo install -Dm644 ./io.github.floppag.ff.desktop -t /usr/share/applications/
sudo install -Dm644 ./io.github.floppag.ff.svg -t /usr/share/icons/hicolor/scalable/apps/

# Update desktop database
sudo update-desktop-database

echo "Fire Floof installation completed."
