# Bash Notes

## Shebang (`#!`)
The first line in your script: `#!/bin/bash`
- It tells the computer to use Bash to run the script.

### Running a Script
- Make it executable: `chmod +x your_script.sh` (You learn this in the Linux module)
- Run it: `./your_script.sh`
- You can also use `bash` or `sh` to run the file if you don't use the shebang.

### Multiline Comments
- To use a multiline comment, use `: '`
  ```bash
  : 'This is a multiline comment'
  ```
- End it with a single quotation mark.

---

## Arguments & Parameters

### Argument Variables
- `$#` - Holds the count of arguments.
  ```bash
  ./script.sh Alice Bob
  ```
  Output: `2`
- `$@` - Holds the value of all arguments.
  ```bash
  ./script.sh Alice Bob
  ```
  Output: `Alice Bob`

### Capturing User Input
- `read` captures user input and stores it in a variable.
  ```bash
  echo "What is your name?"
  read name
  echo "Hello, $name!"
  ```

---

## Running Scripts from Anywhere

- To run a script from any directory, place it in one of the directories listed in `$PATH`.
- Most common location: `/usr/local/bin`
- Move a script to this location and make it executable:
  ```bash
  sudo mv greet.sh /usr/local/bin/greet
  chmod +x /usr/local/bin/greet
  ```
- Now, you can simply run:
  ```bash
  greet
  ```

---

## Variables

### Example:
```bash
message="Hello World!"
fruit="apple orange banana"
number=42
name="Abdullahi"
```

### Parameters:
- `$1, $2, $3` represent arguments passed to the script.
- `$@` prints all parameters.

---

## Arithmetic Expansion
```bash
num1=10
num2=5
sum=$((num1 + num2))
echo "Sum: $sum"
```

---

## Conditional Statements

### If Statements
```bash
if [[ condition ]]; then
    # Code block
else
    # Code block if condition is false
fi
```

### Operators:
- `eq` = equals
- `ne` = not equal to
- `lt` = less than
- `gt` = greater than
- `ge` = greater than or equal to
- `le` = less than or equal to
- `&&` = AND
- `||` = OR

---

## Loops

### While Loops
```bash
count=1
while [[ $count -le 5 ]]; do
    echo "Count: $count"
    ((count++))
done
```

### For Loops
```bash
for item in apple banana orange; do
    echo "$item"
done
```

---

## Functions

### Defining a Function
```bash
hello_world() {
    echo "Hello World!"
}

hello_world
```

---

## Exit Codes
- `$?` shows the exit status of the last command.
  ```bash
  echo $?
  ```
- `0` means success; non-zero means failure.
- Example:
  ```bash
  command -v git 2>/dev/null
  if [[ $? -ne 0 ]]; then
      echo "Git is not installed."
      exit 1
  else
      echo "Git is installed."
  fi
  ```

### Debugging & Safety Flags
- `set -e` - Stops script on error.
- `set -u` - Stops script on uninitialized variables.
- `set -x` - Prints each command before executing (useful for debugging).
- `set -o pipefail` - Fails the pipeline if any command in it fails.
- Recommended setup:
  ```bash
  #!/bin/bash
  set -euxo pipefail
  ```

---

## Environment Variables
- `PATH` stores locations where executable scripts can be found.
- To permanently add a directory to `PATH`:
  ```bash
  echo "export PATH=$PATH:~/my_scripts" >> ~/.zshrc
  source ~/.zshrc
  ```

---

# The Game: Bash Battle Arena 🎮
A fun game to learn Bash scripting through challenges!

### Level 1:
**Mission:** Create a directory `Arena` with three files inside it.
```bash
mkdir Arena
cd Arena
touch warrior.txt mage.txt archer.txt
ls
```

### Level 2:
**Mission:** Write a script that prints numbers 1 to 10.
```bash
#!/bin/bash
set -eu
count=1
while [[ $count -le 10 ]]; do
    echo "Count: $count"
    ((count++))
done
```

### Level 3:
**Mission:** Check if `hero.txt` exists in `Arena`.
```bash
#!/bin/bash
set -eu
if [[ -f Arena/hero.txt ]]; then
    echo "Hero found!"
else
    echo "Hero missing!"
fi
```

### Level 4:
**Mission:** Copy all `.txt` files from `Arena` to `Backup`.
```bash
#!/bin/bash
set -eu
mkdir -p Backup
test -d Arena && cp Arena/*.txt Backup/
```

### Level 5 (Boss Battle):
**Mission:**
1. Create a directory `Battlefield`.
2. Add three files: `knight.txt`, `sorcerer.txt`, `rogue.txt`.
3. If `knight.txt` exists, move it to `Archive`.
4. List the contents of both directories.

```bash
#!/bin/bash
set -eu
mkdir -p Battlefield

touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

if [[ -f "Battlefield/knight.txt" ]]; then
    mkdir -p Archive
    mv Battlefield/knight.txt Archive/
fi

ls Battlefield
ls Archive
```

---

# Assignments

### 1. Basic Arithmetic Script (`maths.sh`)
```bash
#!/bin/bash
num1=50
num2=10

echo "Addition: $((num1 + num2))"
echo "Multiplication: $((num1 * num2))"
echo "Subtraction: $((num1 - num2))"
echo "Division: $((num1 / num2))"
```

### 2. File Operations (`creator.sh`)
```bash
#!/bin/bash
mkdir -p assignment
cd assignment
touch minifile
echo "Some text" > minifile
cat minifile
```

### 3. Conditional Statements (`checkfile.sh`)
```bash
#!/bin/bash
FILE="maths.sh"

if [[ -f "$FILE" ]]; then
    echo "$FILE exists."
    [[ -r "$FILE" ]] && echo "Readable"
    [[ -w "$FILE" ]] && echo "Writable"
    [[ -x "$FILE" ]] && echo "Executable"
else
    echo "$FILE does not exist."
fi

