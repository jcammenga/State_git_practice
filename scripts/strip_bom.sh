#!/usr/bin/env bash
# strip_bom.sh: remove UTF-8 BOMs from input topic CSV files.
#
# Safe to re-run — only touches files that actually start with EF BB BF.
# Run from the repo root.

stripped=0

for f in input/*/*/*.csv; do
  [ -f "$f" ] || continue
  first3=$(head -c 3 "$f" | od -An -tx1 | tr -d ' \n')
  if [ "$first3" = "efbbbf" ]; then
    tail -c +4 "$f" > "$f.tmp" && mv "$f.tmp" "$f"
    echo "Stripped BOM: $f"
    stripped=$((stripped + 1))
  fi
done

if [ "$stripped" -eq 0 ]; then
  echo "No BOMs found."
else
  echo "Stripped $stripped file(s)."
fi
