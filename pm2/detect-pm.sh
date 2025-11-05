#!/usr/bin/env bash
set -euo pipefail

# --- Detect package manager ---
detect_pm() {
  if [[ -f "bun.lockb" || -f "bun.lock" || -f "bunfig.toml" ]]; then
    echo "bun"
  elif [[ -f "package-lock.json" ]]; then
    echo "npm"
  else
    echo "npm"
  fi
}

PM=$(detect_pm)
echo "Detected package manager: $PM"

# --- Save for GitHub Actions output ---
echo "pm=$PM" >> "$GITHUB_OUTPUT"
