# How we change the data

1. `git switch main` then `git pull` (always start from fresh `main`)
2. `git switch -c yourname/short-topic`
3. Edit the file that already lives in `input/<year>/<subindex>/`. **Never save a copy and edit the copy.**
4. `git status` then `git diff`: does it show only what you meant to change?
5. `git add <that file>` (name the file; avoid `git add .`), `git commit -m "2027 top_rate: update Ohio"`
6. `git push -u origin yourname/short-topic`, open a PR into `main`, fill in the template.
7. Open **Files changed** and **Commits** on the PR and check them yourself before asking for review.
8. Respond to review by pushing more commits to the same branch. Don't open a new PR.

Rules of thumb: one topic per PR. Never merge someone else's branch into yours. Never branch from another
person's feature branch. Never force-push. If something looks wrong, stop and ask before "fixing" it.
