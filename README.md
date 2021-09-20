# One makefile to rule them all
A  makefile that aims to simplify development for small to medium scale C/C++ programs and University assignments.

## Contents
- [Features](#features)
- [Description](#description)
- [Future Updates](#future-updates)
- [How to Use](#how-to-use)

## Features 
- Automatic file detection ( source, header and lib )
- Built-in Project Directory Organization 
- Built-in Debugging tools 
- One-Command  Deliverable Generation
- Plug and Play with minimal set-up hassle
-  Easy to use and Beginner Friendly  

## Description
This is a makefile that I built gradually throughout my years in college, based on my own development style and needs for my projects. It aims to make basic C and C++ projects as hassle free to start and develop as possible, while keeping everything organized. My goal was to have a makefile, that with practically no setup/changes, would allow me to compile, run, debug and pack my project into a deliverable using only a small set of "one line commands".

The Automatic Project Directory Organization feature was added to make this makefile Plug and Play for most of the small to medium sized C/C++ projects.

**Disclaimer:** I am by no means an expert in makefiles so there is a chance that there are bugs or mistakes that I missed. Any feedback is more than welcome! I would love to find ways to keep improving this makefile and fill any gaps in my knowledge. 

This is a personal project and it might not fit everyone's needs, so feel free to go rogue and play around with it as much as you want. Add your own rules according to your own needs.

## Future Updates
Although makefiles are not the optimal way of unit testing your code, i would like to include a simple way to run unit tests on my libraries and structs with minimal effort. 

## How to Use
The makefile is "broken" into 5 sections for better organisation. The **only** Sections that you may need to edit are the "Makefile Arguments" and the "Run and Test" Sections.

**Makefile Arguments:** Here you can edit all the project parameters to fit your needs. You can set:
- **The file types** (CODE : .c/.cpp | HEAD : .h/.hpp)
- **The compiler** ( CC : gcc / g++ )
-  **The compilation, execution and debugging arguments** ( CFLAGS, RUNFLAGS, VGFLAGS ) 
-  Any **libraries** that need to be included by the linker ( LINKFLAGS )
- **The final executable's name** ( OUT )

**Run and Test:** This section contains the running and debugging rules - the "one line commands". Here you can add your own rules to expand this makefile.

To learn more about each section, take a look in the makefile comments.
