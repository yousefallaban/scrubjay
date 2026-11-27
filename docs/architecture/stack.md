---
area: stack
---
# Stack

## Languages and frameworks
| Name | Version | Used for |
| --- | --- | --- |
| Markdown | Agent Skills SKILL.md format | the eight skills, their references and the templates |
| Python | 3, standard library only | the static checks in `checks/check.py` |
| POSIX shell | sh | `checks/run.sh` and the eval fixtures |
| JSON | Agent Plugins 1.0.0 and the two marketplace formats | the manifests |

## Commands
| Task | Command |
| --- | --- |
| Test | `sh checks/run.sh` |
| Lint | `python3 checks/check.py` |
| Evals | `claude plugin eval plugin --scaffold --allow-tools Write Edit --trust-plugin`; add `--eval-dir evals/<skill>` for one skill's cases, and `--case <name> --ablation none` for one case without the runs that leave the pack out |
| Install locally | `claude plugin marketplace add .` then `claude plugin install scrubjay@yousefallaban` |
