# Automatic C Program Skeleton Generator

This Bash script automates the process of creating a skeleton for a C program along with a Makefile. It generates a basic "Hello, World!" C program file and a corresponding Makefile, allowing you to quickly start writing and compiling C programs.

## Usage

1. **Clone the Repository:** Clone this repository to your local machine.

2. **Navigate to Directory:** Open your terminal and navigate to the directory where the script is located.

3. **Make the Script Executable:** Run the following command to make the script executable:

   ```bash
   chmod +x see.sh
   ```

4. **Move to `/usr/local/bin`:** Execute the following command to make the script accessible from anywhere by moving it to `/usr/local/bin`:

   ```bash
   sudo mv see.sh /usr/local/bin/see
   ```

5. **Run the Script:** Now, you can run the script from anywhere by simply typing `see` in your terminal.

6. **Follow the Prompts:** The script will prompt you to enter the name of your C program. Enter the desired name and press Enter.

7. **Skeleton Created:** The script will generate a `.c` file with the specified program name containing a basic "Hello, World!" program, and a Makefile for compiling the program.
