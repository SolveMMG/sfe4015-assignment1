# Change-Control Policy (UHMRS case study)

This policy carries forward the Week 3 change-control rules from the UHMRS
Software Configuration Management Plan. Each rule below is enforced by GitHub
rather than by convention.

## Policy rules and how GitHub enforces them

| # | Policy rule (Week 3) | GitHub enforcement on `main` |
| --- | --- | --- |
| 1 | `main` is the production baseline; nobody changes it directly. | Branch protection: **Require a pull request before merging**. Direct pushes are rejected. |
| 2 | Every change is reviewed and approved before it is accepted. | **Require approvals: 1**, with **Require review from Code Owners** (see `.github/CODEOWNERS`). |
| 3 | A change must not break the build. | **Require status checks to pass**: the `build` job in `.github/workflows/ci.yml`. **Require branches to be up to date before merging** is also on. |
| 4 | Every change is attributable to a known author. | **Require signed commits**. Commits are SSH-signed and show GitHub's *Verified* badge. |
| 5 | History on the baseline stays linear and readable. | **Require linear history**. Only **squash merging** is allowed in repository settings. |
| 6 | Changes are traceable to a change request. | The PR template asks for the CR ID, and the branch is named after it (for example `feature/cr-001-...`). |

## Workflow for a change

1. Raise or pick an approved change request (CR-XXX).
2. Branch from the latest `main`: `git switch -c feature/cr-xxx-short-name`.
3. Make signed commits (`commit.gpgsign=true`, `gpg.format=ssh`).
4. Before opening or merging the PR, rebase onto the latest `main`:
   `git fetch origin && git rebase origin/main`
5. Push safely: `git push --force-with-lease`.
6. Open a PR, wait for the `build` check and one code-owner approval.
7. Merge with **Squash and merge**, then delete the branch.
