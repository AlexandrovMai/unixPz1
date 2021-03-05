#!/bin/bash

DB_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
dbus-monitor --system "sender=org.freedesktop.NetworkManager, path=/org/freedesktop/NetworkManager, member=StateChanged" | python "$DB_PATH/time_logger.py"
