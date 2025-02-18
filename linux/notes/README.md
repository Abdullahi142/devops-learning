# Linux Notes

##  Importance of Command Syntax
- Writing commands **exactly** as shown is crucial.
- Capitalization **matters**—changing it may run a completely different command.
- When assigning permissions to **user, group, and others**, you need to specify roles clearly.
  
  **Example:**
  ```sh
  chmod ug=rw, o=w example.txt
  ```
  This applies read & write permissions to **user & group**, and write-only to **others** on `example.txt`.

---
##  Essential Linux Commands

### ** Navigation & Directory Management**
- `pwd` → **Prints working directory** (shows current location).
- `cd` → **Changes directory** (examples below):
  ```sh
  cd /Desktop   # Moves to Desktop
  cd ..         # Moves to parent directory
  cd -          # Goes to the previous directory
  cd ~/.        # Moves to home directory if file/directory begins with .
  ```
- `ls` → **Lists directories & files** in the current location.
- `mkdir` → **Creates a directory**
  ```sh
  mkdir my_folder
  mkdir -p parent/child  # Creates nested directories
  ```
- `rmdir` → **Removes an empty directory**
- `rm -r` → **Removes a directory with its contents**
- `touch` → **Creates a file**
  ```sh
  touch hello.txt
  ```

---
###  File & Permission Management
- `chmod` → **Changes file permissions**
  ```sh
  chmod 754 file.txt   # Owner: rwx, Group: r, Others: r
  ```
- `chown` → **Changes file owner**
  ```sh
  sudo chown user1 file.txt
  ```
- `chgrp` → **Changes file group**
  ```sh
  sudo chgrp group1 file.txt
  ```

---
###  Viewing & Editing Files
- `cat` → **Displays file content**
  ```sh
  cat file.txt
  ```
- `vim` → **Opens file in Vim text editor (creates one if it doesn’t exist)**
- `echo` → **Prints text within a file**
  ```sh
  echo "Hello World" > file.txt   # Overwrites content
  echo "New Line" >> file.txt      # Appends content
  ```
- `grep` → **Searches a file for a specific word**
  ```sh
  grep "hello" file.txt
  ```
- `printenv` → **Displays environment variables**

---
###  Advanced Command Usage
- `|` (Pipeline) → **Passes output of one command as input to another**
  ```sh
  ls -l | grep "file.txt"
  ```
- `awk` → **Text processing tool**
  ```sh
  awk '{print $1, $3}' file.txt  # Prints first & third column
  awk -F, '{print $1}' file.csv  # Uses comma as a delimiter
  ```
- `history` → **Shows last 250 commands**
  ```sh
  !23  # Runs command #23 from history
  ```

---
###  User Management & Privileges
- `man` → **Displays manual for a command**
  ```sh
  man ls
  ```
- `su` → **Switches user**
  ```sh
  su username
  ```
- `sudo` → **Runs command as superuser**
  ```sh
  sudo mkdir secure_folder
  ```
- `sudo su` → **Switches to root user (dangerous if misused)**

---
##  Useful Shortcuts
- **Tab** → Auto-completes commands & filenames.
- `CTRL + L` → Clears terminal screen.
- `CTRL + D` → Ends command execution.
- `!!` → Runs the last command again.
  ```sh
  sudo !!  # Runs the last command with sudo
  ```
- `unalias` → Removes a custom alias.

---
##  Understanding File Permissions
Example of `ls -l` output:
```sh
drwxrwxr-x 2 ubuntu ubuntu 4096 July 26 22:03 MyProject
```
### Breakdown:
| Field | Meaning |
|--------|-----------------|

| `d` | Directory indicator |
| `rwxrwxr-x` | Permissions (owner, group, others) |
| `2` | Hard links count |
| `ubuntu` | Owner of the file/directory |
| `ubuntu` | Group associated with file/directory |
| `4096` | File size in bytes (directory size) |
| `July 26 22:03` | Last modified date & time |
| `MyProject` | File/Directory name |

---
##  Final Notes
- Adding `.` before a filename makes it hidden.
  ```sh
  mkdir .hidden_folder
  ```
- To show hidden files, use:
  ```sh
  ls -a
  ```
- Instead of using `chown` and `chgrp` separately:
  ```sh
  sudo chown user1:user2 file.txt
  ```

