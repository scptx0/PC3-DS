#!/usr/bin/env bash
COMMIT_MSG=$1
re="^(feat|fix|docs|test|refactor|chore)\(.*\): \(Issue #\d+\) .+$"

if ! grep -Pq "$re" "$COMMIT_MSG"; then
  echo "Mensaje de commit inválido. Debe ser de la forma: 'tipo(alcance): (Issue #n) descripción'"
  exit 1
fi