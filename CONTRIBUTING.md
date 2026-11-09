# How we change the data

Follow these steps in order for every change, however small.

1. **Start from the latest `main`.** Switch to `main` and download anyone's newly merged work:
   `git switch main`, then `git pull`.
2. **Make your own branch.** Create it, and name it after yourself and the topic:
   `git switch -c yourname/short-topic`
3. **Edit the existing file.** Open the file that already lives in `input/<year>/<subindex>/` and change it there.
   **Never save a copy and edit the copy**: the pipeline only reads the original.
4. **Check what you changed.** Run `git status` to see which files changed and `git diff` to see exactly which lines.
   Ask yourself: does this show only what I meant to change?
5. **Save your change as a commit.** Stage the file by name (avoid `git add .`, which can sweep in stray files),
   then commit it with a short message that names the year, variable and state:
   `git add input/2027/pit/top_rate.csv`, then `git commit -m "2027 top_rate: update Ohio"`
6. **Send your branch to GitHub and open a pull request (PR).** Push it with
   `git push -u origin yourname/short-topic`, then open a PR into `main` and fill in the template.
7. **Check your own PR before asking anyone to review it.** Open its **Files changed** and **Commits** tabs and
   confirm they show only your file(s) and your commit(s).
8. **Respond to review on the same branch.** Make the requested fix, commit it, and push it. The PR updates itself.
   Don't open a new PR.

## Rules of thumb

- One topic per PR.
- Never merge someone else's branch into yours.
- Never branch from another person's feature branch; always start from `main`.
- Never force-push.
- If something looks wrong, stop and ask before trying to "fix" it.
