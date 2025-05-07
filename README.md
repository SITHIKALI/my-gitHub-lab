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

## introduction-to-git

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

---

## Git Configuration and Basics

### Git Configuration
- **Purpose**: Configure your name and email to ensure proper attribution for commits.
- **Key Facts**:  
  - Git configuration keys follow the shape: `<section>.<key>`.  
  - Use the `--global` flag to set values for all repositories.  
  - `user.name` and `user.email` are required for commit authorship.  
  - Add key-value pairs using:  
    ```bash
    git config --add --global <key> "<value>"
    ```
  - View values using:  
    ```bash
    git config --get <key>
    ```

### Creating a New Repository
1. Navigate to your desired directory.
2. Create a new folder for the repository.
3. Initialize the Git repository:
   ```bash
   git init
   ```
4. Git creates a `.git` folder to track the repository's state.

---

## Validating and Viewing Repository State
- **Validate Repo Creation**:
  Use the following command to list the `.git` directory's contents:
  ```bash
  find .git
  ```
  Example output includes directories such as `.git/config`, `.git/HEAD`, `.git/hooks`, etc.

---

## Tracking File Changes
1. **Create a File**:  
   Create a new file (e.g., `first.md`) and add content.
2. **Check File Status**:  
   - Untracked files:
     ```bash
     git status
     ```
3. **Stage the File**:  
   Add the file to the staging area:
   ```bash
   git add <file>
   ```
4. **Validate Staging**:
   Check the status to confirm the file is staged:
   ```bash
   git status
   ```
5. **Commit the File**:  
   Commit the changes with a message:
   ```bash
   git commit -m "your message"
   ```
6. **Check for Clean State**:  
   After committing, ensure there are no pending changes:
   ```bash
   git status
   ```

---

## Viewing Repository History
- **Command**: Use `git log` with options for a better view:
  ```bash
  git log --graph --decorate
  ```
- **Options**:
  - `--graph`: Displays the commit history as a graph.
  - `--decorate`: Shows branch and HEAD information in the logs.

Example output:
```
* commit <commit-hash> (HEAD -> master)
  Author: <Your Name> <your.email@example.com>
  Date:   <date>
      <commit message>
```

---

## Key Commands Recap
1. **Configure Git**:
   ```bash
   git config --add --global user.name "Your Name"
   git config --add --global user.email "your.email@example.com"
   ```
2. **Initialize Repo**:
   ```bash
   git init
   ```
3. **Track and Commit Files**:
   ```bash
   git add <file>
   git commit -m "message"
   ```
4. **View History**:
   ```bash
   git log --graph --decorate
   ```

---
