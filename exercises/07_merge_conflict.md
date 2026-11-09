# Resolve a conflict in a CSV

**Setup (pair up):** both people branch from `main`; both change **the same row** of `input/2027/prop/limits.csv` differently; one PR merges first.
**Do:** the second person updates their branch with `main`, resolves the conflict markers (keep the correct row, delete the `<<<<<<<` lines), commits, pushes.
**Check yourself:** no conflict markers left; Files changed still shows only your intended line.
