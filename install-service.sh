#!/bin/bash

SERVICE_NAME='timeout-log'
SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPT_PATH="$SCRIPT_DIR_PATH/timeout-logger.sh"
chmod +x "$SCRIPT_DIR_PATH"

export DB_PATH="$SCRIPT_DIR_PATH"
python "$SCRIPT_DIR_PATH/migrate_base.py"

cat > "/etc/systemd/system/$SERVICE_NAME.service" <<EOF
[Unit]
Description=Timeout logger

[Service]
ExecStart=$SCRIPT_PATH

[Install]
WantedBy=multi-user.target
EOF

systemctl start "$SERVICE_NAME"