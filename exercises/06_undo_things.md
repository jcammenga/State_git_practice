# Fix mistakes without panic

Practice each in a throwaway branch: (a) undo your last commit but keep the change (`git reset --soft HEAD~1`); (b) unstage a file (`git restore --staged <file>`); (c) discard an unwanted edit (`git restore <file>`); (d) move a commit made on `main` to a new branch; (e) delete a stray file that was committed.
**Rule:** no force-pushes, and `git status` before every step. If stuck, stop and ask; re-cloning is an acceptable reset.
