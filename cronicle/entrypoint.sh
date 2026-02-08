#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=/opt/cronicle
BIN_DIR=${ROOT_DIR}/bin
DATA_DIR=${ROOT_DIR}/data

mkdir -p "${DATA_DIR}"

# Optional one-time config import
if [ -f "${DATA_DIR}/config.json.import" ] && [ ! -f "${DATA_DIR}/.setup_done" ]; then
  cp "${DATA_DIR}/config.json.import" "${CONF_DIR}/config.json"
fi

# Run setup once to initialize storage
if [ ! -f "${DATA_DIR}/.setup_done" ]; then
  "${BIN_DIR}/control.sh" setup
  touch "${DATA_DIR}/.setup_done"
fi

exec "${BIN_DIR}/control.sh" start
