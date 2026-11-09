# Branch without dragging in an unapproved PR

**Setup (instructor):** leave one open, unapproved PR from branch `instructor/unapproved` touching `sut/sales_rate.csv`.
**Do (wrong way first, in a throwaway clone):** from `instructor/unapproved`, make `yourname/ex04-wrong`, change a `prop/limits.csv` value, open a PR. Look at Files changed and Commits: the instructor's change came along.
**Do (right way):** `git switch main`, `git pull`, `git switch -c yourname/ex04`, make the same change, open a PR.
**Check yourself:** `git log --oneline main..HEAD` lists only your commit(s). Files changed shows only `limits.csv`.
**Rescue:** to fix the wrong one, start the right branch from `main` and `git cherry-pick <your commit>`.
