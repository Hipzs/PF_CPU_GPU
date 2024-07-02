
EXE = app

# C compiler
CC = gcc
# C++ compiler
CXX = g++
# linker
LD = g++

# C flags
CFLAGS = 
# C++ flags
CXXFLAGS = 
# C/C++ flags
CPPFLAGS = -Wall
# dependency-generation flags
DEPFLAGS = -MMD -MP
# linker flags
LDFLAGS = 
# library flags
LDLIBS = 

# build directories
BIN = bin
OBJ = obj
SRC = src

SOURCES := $(wildcard $(SRC)/*.c $(SRC)/*.cc $(SRC)/*.cpp $(SRC)/*.cxx)

OBJECTS := \
	$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(wildcard $(SRC)/*.c)) \
	$(patsubst $(SRC)/%.cc, $(OBJ)/%.o, $(wildcard $(SRC)/*.cc)) \
	$(patsubst $(SRC)/%.cpp, $(OBJ)/%.o, $(wildcard $(SRC)/*.cpp)) \
	$(patsubst $(SRC)/%.cxx, $(OBJ)/%.o, $(wildcard $(SRC)/*.cxx))

# include compiler-generated dependency rules
DEPENDS := $(OBJECTS:.o=.d)

# compile C source
COMPILE.c = $(CC) $(DEPFLAGS) $(CFLAGS) $(CPPFLAGS) -c -o $@
# compile C++ source
COMPILE.cxx = $(CXX) $(DEPFLAGS) $(CXXFLAGS) $(CPPFLAGS) -c -o $@
# link objects
LINK.o = $(LD) $(LDFLAGS) $(LDLIBS) $(OBJECTS) -o $@

.DEFAULT_GOAL = all

.PHONY: all
all: $(BIN)/$(EXE)

$(BIN)/$(EXE): $(SRC) $(OBJ) $(BIN) $(OBJECTS)
	$(LINK.o)

$(SRC):
	mkdir -p $(SRC)

$(OBJ):
	mkdir -p $(OBJ)

$(BIN):
	mkdir -p $(BIN)

$(OBJ)/%.o:	$(SRC)/%.c
	$(COMPILE.c) $<

$(OBJ)/%.o:	$(SRC)/%.cc
	$(COMPILE.cxx) $<

$(OBJ)/%.o:	$(SRC)/%.cpp
	$(COMPILE.cxx) $<

$(OBJ)/%.o:	$(SRC)/%.cxx
	$(COMPILE.cxx) $<

# force rebuild
.PHONY: remake
remake:	clean $(BIN)/$(EXE)

# execute the program
.PHONY: run
run: $(BIN)/$(EXE)
	./$(BIN)/$(EXE)

# remove previous build and objects
.PHONY: clean
clean:
	$(RM) $(OBJECTS)
	$(RM) $(DEPENDS)
	$(RM) $(BIN)/$(EXE)

# remove everything except source
.PHONY: reset
reset:
	$(RM) -r $(OBJ)
	$(RM) -r $(BIN)

-include $(DEPENDS)

hello.c:
	echo "Hello, World"
	echo "This line will print if the file hello does not exist."

blah: blah.o
	cc blah.o -o blah # Runs third

blah.o: blah.c
	cc -c blah.c -o blah.o # Runs second

# Typically blah.c would already exist, but I want to limit any additional required files
blah.c:
	echo "int main() { return 0; }" > blah.c # Runs first

files := file1 file2
some_file: $(files)
	echo "Look at this variable: " $(files)
	touch some_file

file1:
	touch file1
file2:
	touch file2

a := one two# a is set to the string "one two"
b := 'one two' # Not recommended. b is set to the string "'one two'"
x := dude
files := file1 file2
some_file: $(files)
	echo "Look at this variable: " $(files) > some_file
	touch some_file

	