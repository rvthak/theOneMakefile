
# rvthak | sdi1800164@di.uoa.gr

#____________________________________________________________________________________
#
# Project File Structure ( Better Don't Edit this section ) 
#____________________________________________________________________________________

# The names of the directories used
SRC=src           # Source files directory ( .c/ .cpp ) 
INCLUDE=include   # Header files directory ( .h / .hpp ) 
OBJ=obj           # Object files directory (.o) They get auto-placed there 
BIN=bin           # Binary files directory ( executables ) 
LIB=lib           # Pre-compiled libraries directory (.a)

# Lists containing all the .c and .o files
SRCS=$(wildcard $(SRC)/*.$(CODE))
OBJS=$(patsubst $(SRC)/%.$(CODE), $(OBJ)/%.o, $(SRCS))
LIBS=$(wildcard $(LIB)/*.a)

# The name of the deliverable compressed project folder
PROJECT_DIR=$(notdir $(PWD))
TAR_NAME=$(PROJECT_DIR).tar.gz
ZIP_NAME=$(PROJECT_DIR).zip

#____________________________________________________________________________________
#
# Makefile Arguments ( Edit this section to fit the makefile to your own project )
#____________________________________________________________________________________

# The File types that will be used when attempting to compile
CODE=cpp
HEAD=h

# Compiler, compilation arguments and linked libraries
CC=g++
CFLAGS=-g -Wall -I$(INCLUDE)
LINKFLAGS=-lpthread -lm

# Set flags for running your program with "make run"
RUNFLAGS=-D 120 -S 256 -t 20 -T 40 -lo 1 -hi 128 

# The flags used by the "advanced" valgrind options 
VGFLAGS=--leak-check=full --show-leak-kinds=all --leak-resolution=high --track-origins=yes

# The name of the final executable ( do not change the "$(BIN)/" part, only the name after )
OUT=$(BIN)/memsim

#____________________________________________________________________________________
#
# Compilation and Clean-up ( Better Don't Edit this section unless you want to experiment ) 
#____________________________________________________________________________________

all: $(OUT) 

$(OUT): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $@ $(LINKFLAGS)

$(OBJ)/%.o: $(SRC)/%.$(CODE)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BIN)/* $(OBJ)/*

#____________________________________________________________________________________
#
# Run and Test ( Feel free to change the existing commands / add your own ones )
#____________________________________________________________________________________

#  Run the executable
run: $(OUT) 
	./$(OUT) $(RUNFLAGS)

# Run using valgrind (Default args)
vg: all
	valgrind ./$(OUT) $(RUNFLAGS)

# Run using valgrind (Set args for memory leaks and segmentation faults)
vgext: all
	valgrind $(VGFLAGS) ./$(OUT) $(RUNFLAGS)

# Just like 'vgext', but also follows children processes
vgchild: all
	valgrind --trace-children=yes $(VGFLAGS) ./$(OUT) $(RUNFLAGS)

# Check the memory profile of the program using valgrind's massif
vgmass: all
	valgrind --tool=massif ./$(OUT) $(RUNFLAGS)
	# ms_print massif.out.xxx (for output analysis, where xxx is the pid)

# Used for multi-thread debugging
vghel: all
	valgrind --tool=helgrind ./$(OUT) $(RUNFLAGS)

#____________________________________________________________________________________
#
# Organize and Pack project ( Better Don't Edit this section ) 
#____________________________________________________________________________________

# Create the required dirs and move the file to their correct location
org: $(SRC) $(INCLUDE) $(OBJ) $(BIN) $(LIB)
	mv *.$(CODE) $(SRC)
	mv *.$(HEAD) $(INCLUDE)
	mv *.a $(LIB)

$(SRC): 
	mkdir $(SRC)

$(INCLUDE): 
	mkdir $(INCLUDE)

$(OBJ): 
	mkdir $(OBJ)

$(BIN): 
	mkdir $(BIN)

$(LIB): 
	mkdir $(LIB)

# Easily Pack the project into a clean deliverable
tar: clean
	cd ..; tar -czvf $(TAR_NAME) $(PROJECT_DIR)/

zip: clean
	cd ..; zip -r $(ZIP_NAME) $(PROJECT_DIR)/

# Declare these targets as non-files to avoid conflicts with any existing local files 
# and improve performance
.PHONY: org tar zip clean run vg vgext vgchild vgmass vghel all
