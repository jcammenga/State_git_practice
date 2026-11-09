# Applying the repo settings (owner only)

Mirrors the STCI repo's `Protect Main` ruleset: no deleting `main`, no force-pushes, and a pull request
with 1 approval is required. One deliberate difference: **repository admins (Janelle) can bypass the
approval requirement on a PR** (`bypass_mode: pull_request`), so she can merge sandbox PRs alone.
Everyone else still needs a review, which is the habit being practiced.

Rulesets on a **private** repo need GitHub Pro/Team. On the free plan the API answers 403. Either upgrade,
or make the repo public (then it must contain fake data only, which it does).

```bash
gh api -X POST repos/jcammenga/State_git_practice/rulesets --input setup/protect-main-ruleset.json
```

Matching merge settings (same as STCI: merge, squash and rebase all allowed, auto-merge off, no auto-delete of branches):
no change needed, those are GitHub's defaults.
