#!/usr/bin/env bash
# Prompt for the program name
read -p "Enter the name of the C program: " programName

#  Create Makefile
echo -e "CC=gcc\nCFLAGS= -g -Wall -Wextra -std=c11 -pedantic\n\n$programName: $programName.c\n\t\$(CC) \$(CFLAGS) -o $programName $programName.c" >Makefile

#  Create C Skeleton
echo -e "#include <stdio.h>\n\nint main() {\n\n\tprintf(\"Hello, $programName!\\\\n\");\n\n\treturn 0;\n}" >"$programName.c"

echo "Skeleton for $programName created with Makefile and $programName.c."
