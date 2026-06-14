#!/bin/sh
set -e

# Check if we need to initialize config (first run)
if [ ! -f /data/.init-done ]; then
    echo "[entrypoint] First run - initializing config..."
    cp -r /app/default-config/* /data/
    chown -R 9999:9999 /data
    touch /data/.init-done
fi

exec su ts3audiobot -c "$*"
