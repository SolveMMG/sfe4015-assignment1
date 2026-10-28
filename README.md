# SFE4015 Assignment 1: Enforced Change Control

Case-study repository for the University Hostel Maintenance Reporting System
(UHMRS). It turns the Week 3 change-control policy into branch-protection rules
that GitHub enforces on `main`.

- Policy and rule mapping: [docs/CHANGE_CONTROL_POLICY.md](docs/CHANGE_CONTROL_POLICY.md)
- Code owners: [.github/CODEOWNERS](.github/CODEOWNERS)
- Required status check: `build` ([.github/workflows/ci.yml](.github/workflows/ci.yml))

## Branch protection on `main`
Pull request required, 1 code-owner approval, `build` check passing, signed
commits, linear history, squash merge only.
