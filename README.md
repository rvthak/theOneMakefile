# One makefile to rule them all
A  makefile that aims to simplify development for small to medium scale C/C++ programs and University assignments.

## Warning! There is a serious Bug on this version - Directory Name Variables appear empty
I don't suggest using it on this state (Unless you know how to fix it yourself)
I will try to fix it when I have time.

## Contents
- [Features](#features)
- [Setup Options](#setup-options)
- [How to Use](#how-to-use)
- [Description](#description)
- [Future Updates](#future-updates)

## Features 
- Automatic file detection ( source, header and lib )
- Built-in Project Directory Organization 
- Built-in Debugging tools 
- One-Command  Deliverable Generation
- Plug and Play with minimal set-up hassle
-  Easy to use and Beginner Friendly 

## Setup Options
The makefile is "broken" into 5 sections for better organisation. The **only** Sections that you may need to edit are the "Makefile Arguments" and the "Run and Test" Sections.

**Makefile Arguments:** Here you can edit all the project parameters to fit your needs. You can set:
- **The file types** (CODE : .c/.cpp | HEAD : .h/.hpp)
- **The compiler** ( CC : gcc / g++ )
-  **The compilation, execution and debugging arguments** ( CFLAGS, RUNFLAGS, VGFLAGS ) 
-  Any **libraries** that need to be included by the linker ( LINKFLAGS )
- **The final executable's name** ( OUT )

Before you start using your makefile, you should first make sure that you have selected the correct options for your needs (compiler, file types, ... )

**Run and Test:** This section contains the running and debugging rules - the "one line commands". Here you can add your own rules to expand this makefile, but you can probably make do with the existing ones.
So you probably won't need to make any changes on this section in the beginning.

To learn more about each section, take a look in the makefile comments.

## How to Use
1. Start by moving the makefile inside your project's root directory.

2. If your project is already organized in the supported directory structure ( src, include, obj, bin, lib ) you can skip this step. **Else,** if your project is not organized in directories ( all the files are on the same directory ), you will need to first "organize" your project:
```
make org
```
This command creates the needed directories and moves all the files on their corresponding directories

3. Don't forget to make sure that the arguments in the "Makefile Arguments'' section of the makefile, like the selected compiler, are the correct ones for your project.

4. You are ready!

Now you can compile and run your project just by using the command:
```
make run
```
Also you can compile and run using Valgrind with
```
make vg
```
To see all the available "one line commands", check the "Run and Test" section of the makefile and its comments.


## Description
This is a makefile that I built gradually throughout my years in college, based on my own development style and needs for my projects. It aims to make basic C and C++ projects as hassle free to start and develop as possible, while keeping everything organized. My goal was to have a makefile, that with practically no setup/changes, would allow me to compile, run, debug and pack my project into a deliverable using only a small set of "one line commands".

The Automatic Project Directory Organization feature was added to make this makefile Plug and Play for most of the small to medium sized C/C++ projects.

**Disclaimer:** I am by no means an expert in makefiles so there is a chance that there are bugs or mistakes that I missed. Any feedback is more than welcome! I would love to find ways to keep improving this makefile and fill any gaps in my knowledge. 

This is a personal project and it might not fit everyone's needs, so feel free to go rogue and play around with it as much as you want. Add your own rules according to your own needs.

## Future Updates
Although makefiles are not the optimal way of unit testing your code, i would like to include a simple way to run unit tests on my libraries and structs with minimal effort. 
