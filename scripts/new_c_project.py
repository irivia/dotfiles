import sys
import os

def generate_makefile(project_name):
    makefile=f"""CC=gcc
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
\trm -rf $(BUILD)"""
    return makefile

def generate_main_c():
    main_c = """int main(void)
{
}"""
    return main_c

def main():
    if len(sys.argv) < 2:
        print("Error: must provide project name")
        exit(1)
    project_name = sys.argv[1]
    project_dir = f"/mnt/d/programming/repos/{project_name}"
    if os.path.isdir(project_dir):
        print("Error: Project with that name already exists")
        exit(1)
    os.mkdir(project_dir)
    os.mkdir(f"{project_dir}/src")
    with open(f"{project_dir}/Makefile", "a") as f:
        f.write(generate_makefile(project_name))
    with open(f"{project_dir}/src/main.c", "a") as f:
        f.write(generate_main_c())

main()
