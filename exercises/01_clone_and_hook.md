# Clone, enable the hook, look around

**Do:** clone the repo, run `git config core.hooksPath .githooks`, open `input/2027/pit/top_rate.csv` and its entry in `dictionary.csv`.
**Check yourself:** `git config core.hooksPath` prints `.githooks`; you can say which file holds `std_ded_single` without searching.
**Why:** the hook only protects you if it is switched on, and `dictionary.csv` is how you find the right file.
