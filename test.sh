#!/bin/bash
# Checks the playbooks, then runs site.yml twice: the second run must change nothing.
# Run with:  ./test.sh     Stops at the first problem, with a non-zero exit code.
set -euo pipefail
cd "$(dirname "$0")"

echo "== syntax"
ansible-playbook --syntax-check site.yml patch.yml health.yml >/dev/null
echo "ok"

echo "== lint"
ansible-lint --nocolor -q

echo "== apply"
ansible-playbook site.yml >/dev/null
echo "ok"

echo "== idempotence: a second run must change nothing"
recap=$(ansible-playbook site.yml | sed -n '/PLAY RECAP/,$p')
echo "$recap"
if echo "$recap" | grep -Eq 'changed=[1-9]|failed=[1-9]|unreachable=[1-9]'; then
  echo "FAILED: the second run changed something"; exit 1
fi

echo "== health"
ansible-playbook health.yml >/dev/null
echo "ok"
echo "All checks passed."
