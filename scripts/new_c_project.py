#!/usr/bin/env python3

import sys
import os
import subprocess

def generate_makefile(project_name):
    makefile=''
    place_holder ='PROJECT_NAME'
    with open("./makefile_preset", "r") as f:
        makefile = f.read()
    makefile = makefile.replace(place_holder, project_name)
    return makefile

def generate_main_c():
    main_c=''
    with open("./preset.c", "r") as f:
        main_c = f.read()
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
    try:
        subprocess.call('git init', shell=True, cwd=project_dir)
        subprocess.call('git branch -M main', shell=True, cwd=project_dir)
    except:
        print("Error! Couldn't initialize git repo")
        exit(1)
    with open(f"{project_dir}/.gitignore", "w") as f:
        f.write("build/\n")

main()
