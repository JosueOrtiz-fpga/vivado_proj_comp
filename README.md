# Vivado \ Vitis Build 
This repository provides a repo template to use for building Vivado and Vitis projects using a Makefile
## Tools Setup
Paths to the Vivado and Vitis executable must be provided in the make/scripts/env_vars.mak file. *NOTE: The Vitis build script provided uses the new Vitis Python API introduced with Vitis 2023*
## Directory Structure
The build scripts expect a particular directory structure for finding design files in the top/ folder as explained below:
```
top
 |--top-level a             # "top-level a" direcotry
        |--hw               # vivado design folder
        |   |--hdl          # hdl folder
        |   |   ||--bd      # block design folder (.tcl)
        |   |--xdc          # constraints folder (.xdc)
        |_sw                # vitis design folder
            |_configpy      # project config script
            |_src           # source folder
 |-top-level b              # multiple top-levels using the
                            # same structure are supported
```
## Make Commands
The following make commands are used to build the projects. *NOTE: "top-level a" is just a place holder for the user defined name*. 
```
cd make
make "top-level a"          # build vivado project
make "top-level a".sw    # build vitis project
```
