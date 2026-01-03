#!/usr/bin/env bash
set -euo pipefail

FILE="$1"

required=(orgname servicenow_req app env displayname apptype callbacks granttypes)

for key in "${required[@]}"; do
  value=$(yq -r ".${key}" "$FILE")
  if [[ -z "$value" || "$value" == "null" ]]; then
    echo "❌ $FILE: missing required key '${key}'"
    exit 1
  fi
done

echo "✅ $FILE: basic validation passed"
