#!/bin/bash
if systemctl --user -q is-active hyprsunset.service; then
    # Active
    echo "{\"text\": \"\uf185\", \"class\": \"active\", \"tooltip\": \"Sunset Enabled\"}"
else
    # Inactive
    echo "{\"text\": \"\uf186\", \"class\": \"inactive\", \"tooltip\": \"Sunset Disabled\"}"
fi