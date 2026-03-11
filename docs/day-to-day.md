# Day-to-day tutorial

This guide is for normal daily work.

It assumes:

- you already ran `./install.sh`
- you can use `git menu`
- you are new to `lazygit` or not comfortable with it yet

The goal is simple: make Git feel calmer, faster, and less error-prone.

## The big idea

You do not need to memorize everything.

This toolkit is designed around a few habits:

1. Use `git menu` when you forget what exists
2. Use one worktree per real feature
3. Use `lazygit` to review before every commit
4. Use `tmux` and AI tools only when the task is big enough to need them

If you only remember those four things, you will already work better than many people using plain Git.

## First five commands to learn

```bash
git doctor
git menu
git feature start my-task
gwt my-task
git lg
```

What they do:

- `git doctor`: check whether your environment is ready
- `git menu`: show the available workflow actions
- `git feature start my-task`: create a feature branch and a matching worktree
- `gwt my-task`: jump into that worktree in your current shell
- `git lg`: open lazygit in the current repo or worktree

## A normal workday

### 1. Start your day

```bash
git doctor
git sync
git dash
```

This gives you:

- confidence that the tools are installed
- a fresh local view of remotes
- a quick overview of branch and worktree state

### 2. Start a new task

```bash
git feature start onboarding-copy
gwt onboarding-copy
```

Now you are in a clean, dedicated directory for that task.

This matters because it avoids:

- branch switching back and forth
- stashing just to answer another request
- mixing unrelated changes in one working tree

### 3. Make changes normally

Edit files, run tests, do your normal work.

When you want to review what changed:

```bash
git lg
```

## Why lazygit is worth loving

People often avoid `lazygit` because they think it is "one more tool to learn".

In practice, it removes a lot of Git friction:

- you see changed files immediately
- you can inspect diffs before committing
- staging feels safer and more visual
- branches, stashes, and logs are easier to browse

The real reason to love it is this:

It makes good Git behavior easier than sloppy Git behavior.

Instead of:

```bash
git add .
git commit -m "stuff"
```

You start doing this:

1. open lazygit
2. look at the changed files
3. stage only what belongs together
4. review the patch
5. commit with confidence

That is a much better habit, especially under pressure.

## If you never used lazygit before

Start with only three goals:

1. open it
2. review files and diffs
3. make one clean commit

That is enough for the first week. You do not need to master the entire interface on day one.

### The easiest first use

```bash
git lg
```

Then do this:

1. move through the changed files list
2. look at the diff
3. stage the files you want
4. commit

Repeat that until it feels normal.

## The daily lazygit loop

Use this cycle every time you are about to commit:

1. open `git lg`
2. scan the changed files
3. read the diff
4. stage only the right changes
5. commit
6. push when ready

This one loop gives you most of the benefit.

## Common daily situations

### I forgot what commands exist

```bash
git menu
```

### I need to resume another feature quickly

```bash
git wt list
gwt some-feature
git lg
```

### I have two real tasks in parallel

Do not juggle both in one directory.

Instead:

```bash
git feature start task-one
git feature start task-two
```

Now each task has its own worktree.

### I want a bigger workspace

```bash
git cockpit
```

That gives you a tmux-based workspace around the current worktree.

## Lazygit cheatsheet

Treat this as a practical cheatsheet, not a complete manual.

### The core habit

- Open: `git lg`
- Goal: review before every commit

### What to do inside lazygit

- Move through changed files
- Review diffs
- Stage intentionally
- Commit only one idea at a time

### Custom shortcuts added by this repo

- `Ctrl-W`: open tmux cockpit
- `Ctrl-O`: open Codex
- `Ctrl-Y`: open Cline
- `Ctrl-R`: sync current branch
- `Ctrl-B`: pick a recent branch
- `Ctrl-T`: open a worktree in tmux mode

### When to use lazygit

- before every commit
- when checking a diff
- when staging only part of your work
- when browsing stashes, commits, or branches

### When not to rely on stash

If the work is real and ongoing, prefer a new worktree:

```bash
git feature start another-task
```

### One-sentence rule

Use worktrees for context separation, and use lazygit for commit quality.

## The minimum workflow to remember

If everything else is forgotten, remember this:

```bash
git feature start my-task
gwt my-task
git lg
```

That is enough to get daily value from this setup.
