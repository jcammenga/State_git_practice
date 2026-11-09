# Break and fix the dictionary check

**Do:** add a column `new_var` to `input/2027/pit/top_rate.csv` without a dictionary entry. Watch the pre-commit hook (if R is installed) or the PR check fail. Then add the dictionary row and see it pass.
**Why:** the real repo blocks undocumented columns the same way.
