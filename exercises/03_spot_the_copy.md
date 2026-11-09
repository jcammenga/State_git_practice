# Spot the copied spreadsheet

**Setup (instructor):** open a PR that adds `input/2027/pit/top_rate - Copy.csv` with one value changed, and leaves `top_rate.csv` untouched.
**Do:** review that PR. Say what is wrong, what its Files changed tab shows, and how the author should fix it (move the edit into `top_rate.csv`, delete the copy, same branch).
**Why:** a copy changes nothing the pipeline reads. Added files in a PR meant to change data are the tell.
