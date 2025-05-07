# my-gitHub-lab

Everything You'll Need to Know About Git  
A Practical guide to using Git and prepare you to be the wizard of your team

## Table of Contents

- [Introduction](#introduction)
  - [Introduction to Git](#introduction-to-git)
  - [Your First Git Repo](#your-first-git-repo)
  - [A Bit Of Plumbing](#a-bit-of-plumbing)
  - [Configuring Git](#configuring-git)
- [Branches, Merges, and More](#branches-merges-and-more)
  - [Branching in Git](#branching-in-git)
  - [Merge and Rebase](#merge-and-rebase)
  - [HEAD](#head)
- [Going Remote](#going-remote)
  - [Remote](#remote)
  - [Stashing](#stashing)
  - [Rebasing is Complicated](#rebasing-is-complicated)
- [Git Gud](#git-gud)
  - [Git Bisect](#git-bisect)
  - [Revert](#revert)
  - [Reset](#reset)
  - [Worktree](#worktree)
  - [Tags](#tags)
  - [Tools](#tools)
  - [How I Use Git](#how-i-use-git)

## Introduction
---
# Git Learning Lab

## Goal

The aim of this course is to teach Git effectively. Not every command will be covered, but enough will be taught to ensure you understand Git and can use it confidently.

## Getting Started with `man`

- `man` stands for manual and contains all the information about commands.
- Example: `man man` opens the manual for `man`.
- To see all Git commands, use:
  ```bash
  ➜ man git- # Press tab for autocomplete with zsh
  ```
  You may see a large number of options (e.g., "147 possibilities").

### Navigation Shortcuts in `man` Pages:
- `j` – Move one line down
- `k` – Move one line up
- `d` – Move half a page down
- `u` – Move half a page up
- `/term` – Search for a term
- `n` – Jump to the next search result
- `N` – Jump to the previous search result

### Example Exercise:
Search for the term **bold** in `man` pages to understand how bolded terms are used.  
Solution:
- **Bold text**: Type exactly as shown.
- **Italic text**: Replace with the appropriate argument.
- `[options]`: Optional arguments.
- `-a|-b`: Options separated by `|` cannot be used together.
- `argument ...`: Repeatable arguments.
- `[expression] ...`: Repeatable expressions within brackets.

---

## What is Git?

Git is a **distributed version control system (VCS)**. Unlike traditional centralized systems, Git allows you to work locally and diverge as needed without requiring admin privileges.

---

## Key Terms

1. **Repo**: A Git-tracked project.
2. **Commit**: A snapshot of the project at a specific point in time.
   - Represented by a 40-character SHA (generated from changes, author, time, etc.).
3. **Index / Staging Area**:
   - A critical data structure in Git. Changes added with `git add` are stored in the index and staged for commit.
4. **Squash**: Combine multiple commits into one.
5. **Working Tree**: The current state of your project files set up by `git init` or `git clone`.
6. **File States**:
   - **Untracked**: Files not yet staged or committed. Be cautious, as deleting these files will result in permanent loss.
   - **Staged (Indexed)**: Files staged for commit using `git add`.
   - **Tracked**: Files already being tracked by Git. These can also have staged changes.
7. **Remote**: The same Git repository hosted elsewhere (e.g., GitHub).

---

## Key Facts About Git

- Git is an **acyclic graph**:
  - Each commit is a node in the graph.
  - Each pointer represents a parent-child relationship.
- **Commit Early, Commit Often**:
  - Untracked files are permanently lost if deleted.
  - You can always squash commits later.
- Use `man git-<command>` to access detailed manuals.

---

## A Warning

Many users rely on just five basic Git commands:
1. `push`
2. `pull`
3. `add`
4. `commit`
5. `status`

Everything else can feel mysterious and intimidating. This course is designed to make Git approachable.

**If you are already comfortable with advanced commands** like `rebase`, `rerere`, `reflog`, `log`, `cat-file`, `config`, and `reset`, this course may not be for you.

---

## Git State

During this course, we will adjust some default settings. Examples:

1. Check and unset default branch:
   ```bash
   git config --get --global init.defaultBranch
   git config --global --unset init.defaultBranch
   ```
2. Ensure `rerere` (reuse recorded resolution) is disabled:
   ```bash
   git config --global rerere.enabled
   git config --global --unset rerere.enabled
   git config --global rerere.enabled
   ```

---

## Course Structure

Each section will:
1. Provide a set of instructions.
2. Allow time for you to complete tasks independently.
3. Include a walkthrough of the tasks.

---

## Learning Approach

- This course is interactive. The best way to learn Git is to **practice**.
- Feel free to ask questions. Your feedback helps improve the course.


Here's a summarized guide for your README file based on the provided content:

---

# Your First Git Repo

## Getting Started with Git

### Configuring Git

Before using Git, set up your name and email to ensure your commits are properly attributed.

#### Key Facts:
- Git configuration levels: **global** (all projects) and **local** (specific to a project).
- Global config applies to all repositories unless overridden by local config.
- Config keys follow the format: `<section>.<key>`.

#### Commands:
1. Set name and email globally:
   ```bash
   git config --add --global user.name "Your Name"
   git config --add --global user.email "your.email@example.com"
   ```
2. Check if values are already set:
   ```bash
   git config --get user.name
   git config --get user.email
   ```

---

### Creating a New Repo

To create a new repository:
1. Navigate to your desired directory:
   ```bash
   cd /path/to/new
   ```
2. Create a new directory:
   ```bash
   mkdir my-first-git-repo
   cd my-first-git-repo
   ```
3. Initialize the repo:
   ```bash
   git init
   ```

To verify the repo is created, list the `.git` directory:
```bash
find .git
```

---

### Basic Git Commands

These commands make up 80% of Git usage:
1. `git add <file>` – Add files to the staging area.
2. `git commit -m "<message>"` – Commit staged changes with a message.
3. `git status` – View the state of your working directory and staging area.

#### Example Workflow:
1. Create a new file:
   ```bash
   vim first.md
   ```
   Add some content to it.

2. Check the status:
   ```bash
   git status
   ```
   You’ll see the file listed as **untracked**.

3. Stage the file:
   ```bash
   git add first.md
   ```

4. Check the status again:
   ```bash
   git status
   ```
   The file will now appear under **Changes to be committed**.

5. Commit the file:
   ```bash
   git commit -m "my first commit"
   ```

6. Check the status one last time:
   ```bash
   git status
   ```
   The working tree should now be clean.

---

### Viewing Commit History

To view the history of commits, use `git log`. Enhance the log with options:
- `--graph` – Visualizes the commit history as a graph.
- `--decorate` – Adds branch and HEAD labels to commit logs.

#### Example:
```bash
git log --graph --decorate
```

---

### Additional Notes

- Git uses a `.git` directory to store all repository metadata.
- Always commit early and often to avoid losing changes.
- Explore more options using:
  ```bash
  man git-log
  ```

---

This guide covers essential Git concepts and commands to help you start managing your projects effectively. Happy coding!

--- 
Here's a summarized guide for your README file based on the provided content:

---

# Your First Git Repo

## Getting Started with Git

### Configuring Git

Before using Git, set up your name and email to ensure your commits are properly attributed.

#### Key Facts:
- Git configuration levels: **global** (all projects) and **local** (specific to a project).
- Global config applies to all repositories unless overridden by local config.
- Config keys follow the format: `<section>.<key>`.

#### Commands:
1. Set name and email globally:
   ```bash
   git config --add --global user.name "Your Name"
   git config --add --global user.email "your.email@example.com"
   ```
2. Check if values are already set:
   ```bash
   git config --get user.name
   git config --get user.email
   ```

---

### Creating a New Repo

To create a new repository:
1. Navigate to your desired directory:
   ```bash
   cd /path/to/new
   ```
2. Create a new directory:
   ```bash
   mkdir my-first-git-repo
   cd my-first-git-repo
   ```
3. Initialize the repo:
   ```bash
   git init
   ```

To verify the repo is created, list the `.git` directory:
```bash
find .git
```

---

### Basic Git Commands

These commands make up 80% of Git usage:
1. `git add <file>` – Add files to the staging area.
2. `git commit -m "<message>"` – Commit staged changes with a message.
3. `git status` – View the state of your working directory and staging area.

#### Example Workflow:
1. Create a new file:
   ```bash
   vim first.md
   ```
   Add some content to it.

2. Check the status:
   ```bash
   git status
   ```
   You’ll see the file listed as **untracked**.

3. Stage the file:
   ```bash
   git add first.md
   ```

4. Check the status again:
   ```bash
   git status
   ```
   The file will now appear under **Changes to be committed**.

5. Commit the file:
   ```bash
   git commit -m "my first commit"
   ```

6. Check the status one last time:
   ```bash
   git status
   ```
   The working tree should now be clean.

---

### Viewing Commit History

To view the history of commits, use `git log`. Enhance the log with options:
- `--graph` – Visualizes the commit history as a graph.
- `--decorate` – Adds branch and HEAD labels to commit logs.

#### Example:
```bash
git log --graph --decorate
```

---

### Additional Notes

- Git uses a `.git` directory to store all repository metadata.
- Always commit early and often to avoid losing changes.
- Explore more options using:
  ```bash
  man git-log
  ```

---

This guide covers essential Git concepts and commands to help you start managing your projects effectively. Happy coding!

--- 

