# Excel saves: BOM, dates, whole-file rewrites

**Do:** open `input/2027/sut/sales_rate.csv` in Excel, change one cell, save as CSV UTF-8, and try to commit. The hook should refuse (BOM) or the diff should show every row changed.
**Fix:** run `scripts/strip_bom.sh` (Git Bash), re-stage, and compare `git diff --stat`. Learn what a one-cell diff should look like.
**Why:** this is the most likely July surprise.
