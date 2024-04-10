#!/bin/bash
LOG_FILE="/var/log/auth.log"
EMAIL="your-email@example.com"
FAILED_ATTEMPTS=$(grep "Failed password" "${LOG_FILE}" | wc -l)

if [ "${FAILED_ATTEMPTS}" -gt 0 ]; then
    echo "There have been ${FAILED_ATTEMPTS} failed SSH login attempts." | mail -s "SSH Login Alert" "${EMAIL}"
fi
