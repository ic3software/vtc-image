#!/bin/sh

DATA_DIR="/app/vtc/data"
CONFIG_FILE="/app/vtc/config.toml"

if [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A $DATA_DIR 2>/dev/null)" ] || [ ! -f "$CONFIG_FILE" ]; then
  [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A $DATA_DIR 2>/dev/null)" ] && echo "⚠️  No data found."
  [ ! -f "$CONFIG_FILE" ] && echo "⚠️  No config found."
  echo "👉 Please run: kubectl exec -it <pod> -- vtc setup"
  echo "⏳ Holding container..."
  sleep infinity
fi

echo "✅ Data found, starting vtc..."
exec vtc
