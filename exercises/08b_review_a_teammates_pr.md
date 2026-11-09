# Review and approve a teammate's PR

**Setup:** pair up (the instructor assigns pairs). Each person's exercise 02 PR is the one their partner reviews. You can't review or approve your own PR.

**Do (as the reviewer):**
1. Open your partner's PR. Before reading any data, open **Files changed** and **Commits**. Confirm they show only the file the author meant to change, only the lines they meant to change, and only their own commit(s). A copied file, a whole-file rewrite, or someone else's commits means something went wrong: stop here and comment.
2. Check the value itself against the source the author linked in the PR description. Is the number what the source says? Is it the right state, variable and year?
3. Leave at least one comment on a specific line: click the **+** beside a line in Files changed, write the comment, and choose **Start a review** (or **Add single comment**).
4. Finish with **Review changes** (top right of Files changed):
   - **Approve** if everything checks out.
   - **Request changes** if something needs fixing. Say what and why.
5. If you requested changes, wait for the author to push a fix to the same branch, then look at the new commit and review again.

**Check yourself:** the PR shows your approval (a green check) in its review history, and you can say what you checked before approving.

**Why:** approving means "I looked at this and it's right," not "it looks fine." Reviewing is the second chance to catch a copied file, a dragged-in commit, or a wrong number before it reaches `main`.

**Note:** the repo owner can bypass approval, but the owner shouldn't be anyone's approver here. Practice a real approval from a teammate.
