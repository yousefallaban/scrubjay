# Eval cases

One folder per skill, one folder per case. Each case has a `prompt.md`, its graders under `graders/`, and, where it needs a project to write into, a `fixture.sh` named in `case.yaml` that builds a small webshop `docs/` in the empty workspace.

Run from the plugin root, granting the write tools the cases need:

```
claude plugin eval . --scaffold --allow-tools Write Edit --trust-plugin
```

Add `--runs 1 --ablation none` while iterating; the release check runs the default three runs with the no-plugin baseline arm. Results land in `evals/results/`, which is ignored by git.

Two things the runner wants: a `case.yaml` carries `schema_version: "1.1"`, and a `regex` grader over a file takes an exact path under `target: {source: file, path: ...}`, so a prompt names the file when the agent would otherwise choose the name. `file_exists` accepts a glob.

The cases never grant `Bash`: the runner refuses a Bash grant on a machine whose Docker credential store holds a symlink, and the skills state what to do without a shell. Steps that run the project's tests are covered by the by-hand and dogfood runs on the example repo.
