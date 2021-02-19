#!/bin/bash

SERVICE_NAME='timeout-log'
SCRIPT_PATH="$(pwd)/timeout-logger.sh"
chmod +x "$SCRIPT_PATH"

cat > "/etc/systemd/system/$SERVICE_NAME.service" <<EOF
[Unit]
Description=Timeout logger

[Service]
ExecStart=$SCRIPT_PATH

[Install]
WantedBy=multi-user.target
EOF

systemctl start "$SERVICE_NAME"