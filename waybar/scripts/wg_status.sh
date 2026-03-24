#!/bin/bash 
if systemctl --user -q is-active tunnel-util.target; then
    # Active
    echo "{\"text\": \"\udb81\udfe5\", \"class\": \"connected\", \"tooltip\": \"VPN Active (Sunshine/wg0/SSH)\"}"
else
    # Inactive
    echo "{\"text\": \"\udb81\udfe6\", \"class\": \"disconnected\", \"tooltip\": \"VPN Offline\"}"
fi