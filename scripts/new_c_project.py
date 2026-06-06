#!/usr/bin/env python3

import sys
import os

def generate_makefile(project_name):
    makefile=\
f"""CC=gcc
SRC=$(wildcard ./src/*.c)
HEADERS=$(wildcard ./src/*.h)
CFLAGS=-O3 -Werror -Wall -Wextra
DFLAGS=-O0 -g -Wall -Wextra
LFLAGS=
BUILD=build
EXE=$(BUILD)/{project_name}
DEBUG=$(BUILD)/{project_name}-deb

all: $(BUILD) $(EXE) $(DEBUG)

$(EXE): $(SRC) $(HEADERS)
\t$(CC) $(CFLAGS) -o $(EXE) $(SRC) $(LFLAGS)

$(DEBUG): $(SRC) $(HEADERS)
\t$(CC) $(DFLAGS) -o $(DEBUG) $(SRC) $(LFLAGS)

run: $(EXE)
\t./$(EXE)

debug: $(DEBUG)
\t./$(DEBUG)

$(BUILD):
\tmkdir -p $(BUILD)

.PHONY: clean
clean:
\trm -rf $(BUILD)
"""
    return makefile

def generate_main_c():
    main_c =\
"""#include <stdio.h>

int main(void)
{
    printf("Hello, world!\\n");

    return 0;
}
"""
    return main_c

def main():
    projects_path_var = "PROJECTS_PATH"
    try:
        project_name = sys.argv[1]
    except: 
        print("Error: must provide project name")
        exit(1)
    try:
        project_dir = f"{os.environ[projects_path_var]}/{project_name}"
    except:
        print(f"Error! '{projects_path_var}' shell variable must be defined")
        exit(1) 
    try:
        os.makedirs(f"{project_dir}/src")
    except:
        print("Error: Project with that name already exists")
        exit(1)
    with open(f"{project_dir}/Makefile", "a") as f:
        f.write(generate_makefile(project_name))
    with open(f"{project_dir}/src/main.c", "a") as f:
        f.write(generate_main_c())

main()
