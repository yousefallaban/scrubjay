#!/usr/bin/env sh
# Runs the static checks, then Claude Code's own validator when its CLI is present.
set -eu
cd "$(dirname "$0")/.."
python3 checks/check.py
if command -v claude >/dev/null 2>&1; then
  echo "claude CLI found: validating with --strict"
  claude plugin validate --strict ./plugin
  claude plugin validate --strict .
else
  echo "claude CLI not found: skipping claude plugin validate"
fi
