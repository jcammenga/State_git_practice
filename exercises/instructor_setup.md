# Instructor setup (Janelle)

Traps to leave in place before the group starts:
1. An open, **unapproved** PR from `instructor/unapproved` touching `input/2027/sut/sales_rate.csv` (exercise 04).
2. A PR adding `input/2027/pit/top_rate - Copy.csv` (exercise 03).
3. Optional: the real `.githooks/pre-commit` needs R on PATH for the dictionary check; without R it warns and the PR check catches it.

All data is fake (values generated randomly, DC included as a row), so the repo can safely be made public if you want rulesets on the free plan.
