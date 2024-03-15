#!/bin/bash

# Prompt for the C program name
read -p "Enter the name of the C program: " programName

#  Create Makefile
echo -e "CC=gcc\nCFLAGS= -g -Wall -Wextra -std=c11 -pedantic\n\n$programName: $programName.c\n\t\$(CC) \$(CFLAGS) -o $programName $programName.c" >Makefile

#  Create C file with Hello, World program
echo -e "#include <stdio.h>\n\nint main() {\n\n\tprintf(\"Hello, World!\");\n\n\n\treturn 0;\n}" >"$programName.c"

echo "Skeleton for $programName created with Makefile and $programName.c."
