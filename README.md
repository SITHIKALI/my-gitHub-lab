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

### A Bit Of Plumbing

#### Git Internal Representations

To understand Git, you must go past the porcelain and check out the plumbing.

---

#### SHAs (Secure Hash Algorithm)

- Every Git commit comes with a SHA (a hash with 0-9a-f characters).
- You can use the first 7 characters of a SHA for Git to identify what you are referring to.

**Command to Get the SHA of a Commit**  
```bash
git log
```

**Example Output**:  
```plaintext
commit 5ba786fcc93e8092831c01e71444b9baa2228a4f (HEAD -> master)
Author: YourName <your.email@example.com>
Date:   Mon May 14 03:44:45 2025 -0700

    Initial commit
```

The long string after `commit` is the SHA.

---

#### Commit File Data Inside `.git` Folder

Git stores all state in files under the `.git` directory.

**Steps to Locate a Commit's Data**:
1. Find the first 2 characters of your commit SHA.
2. Navigate to the `.git/objects` directory and look for a folder matching the first 2 characters.
3. Inside that folder, you’ll find a file with the remaining 38 characters of the SHA.

**Commands**:
```bash
ls -la .git/objects
ls -la .git/objects/<first-two-characters>
cat .git/objects/<first-two-characters>/<remaining-38-characters>
```

**Example Output**:
```bash
➜ ls -la .git/objects
drwxrwxr-x 2 YourName YourName 4096 May 14 03:44 .
drwxrwxr-x 3 YourName YourName 4096 May 14 03:44 ..
drwxrwxr-x 2 YourName YourName 4096 May 14 03:44 5b

➜ ls -la .git/objects/5b
-r--r--r-- 1 YourName YourName  125 May 14 03:44 a786fcc93e8092831c01e71444b9baa2228a4f
```

---

#### Inspecting Files in Git Data Store

Use `git cat-file` to inspect Git data objects such as commits, trees, or blobs.

**Command**:  
```bash
git cat-file -p <sha>
```

---

#### Hashing a File with `git hash-object`

The `git hash-object` command is used to compute the SHA-1 hash of a file. This is how Git uniquely identifies files in its object database.

**Command**:  
```bash
git hash-object first.txt
```
Here’s how the updated section will look in proper README format:

---

#### Storing and Inspecting Files in Git Database

If a file is not yet in Git's database, you can manually add it using the following commands:

1. **Store File in Git Database**:  
   Use the `git hash-object -w <filename>` command to store the file in Git's database.

   **Command**:  
   ```bash
   git hash-object -w first.txt
   ```
   **Example Output**:  
   ```plaintext
   db7e56d87ff1f8c4bc6ee81a8e3f7417781ea560
   ```

2. **Inspect the File Content**:  
   Use the `git cat-file -p <sha>` command to view the content of the file stored in the database.

   **Command**:  
   ```bash
   git cat-file -p db7e56d87ff1f8c4bc6ee81a8e3f7417781ea560
   ```
   **Example Output**:  
   ```plaintext
   shows file content
   ```

---

**Explanation**:  
This command calculates the SHA-1 hash of the file `first.txt` and outputs the hash. Git uses this hash to track the file in its object database.

---

#### Example Exercise

1. Inspect a Commit SHA:  
   ```bash
   git cat-file -p <commit-sha>
   ```

   **Example Output**:
   ```plaintext
   tree 4e507fdc6d9044ccd8a4a3061324c9f711c4667d
   author YourName <your.email@example.com> 1705891256 -0700
   committer YourName <your.email@example.com> 1705891256 -0700

   Initial commit
   ```

2. Inspect a Tree SHA (Directory):  
   ```bash
   git cat-file -p <tree-sha>
   ```

   **Example Output**:  
   ```plaintext
   100644 blob 9a71f81a4b4754b686fd37cbb3c72d0250d344aa    first.md
   ```

3. Inspect a Blob SHA (File):  
   ```bash
   git cat-file -p <blob-sha>
   ```

   **Example Output**:
   ```plaintext
   hello world
   ```

---

#### Key Concepts

- **Tree**: Represents a directory.
- **Blob**: Represents a file.

---

#### Big Takeaway

- Git does **not** store diffs. It stores the complete version of the entire source at the point of each commit.
- Each commit contains pointers to the entire worktree, making it efficient in tracking changes without duplicating the entire source code.

