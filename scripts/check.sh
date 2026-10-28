#!/usr/bin/env bash
# Fails the build if a controlled configuration item is missing or empty.
set -euo pipefail

required=(
  README.md
  CHANGELOG.md
  docs/CHANGE_CONTROL_POLICY.md
  .github/CODEOWNERS
  .github/pull_request_template.md
)

status=0
for f in "${required[@]}"; do
  if [[ -s "$f" ]]; then
    echo "ok      $f"
  else
    echo "MISSING $f"
    status=1
  fi
done

exit "$status"
