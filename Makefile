CC ?= gcc 			# define variable CC. It can be override
CFLAGS := -g -Og 	# define variable CFLAGS, meaning the options used for gcc

LIB_NAME := toy
STATIC_LIB := lib$(LIB_NAME).a 		# define variable STATIC_LIB, meaning the name of static library
DYNAMIC_LIB := lib$(LIB_NAME).so 	# define variable STATIC_LIB, meaning the name of dynamic library

MAIN_SRC := main.c 		# define variable MAIN_SRC, meaning source file name of main program
MAIN_OBJ := main.o

DYNAMIC_MAIN := range_sum_d
STATIC_MAIN  := range_sum_s

LIB_SRC := toy.c 		# define variable LIB_SRC, meaning source file name of library
LIB_OBJ := toy.o

# rule for compiling toy.c
$(LIB_OBJ): $(LIB_SRC)
	$(CC) $(CFLAGS) -c -fpic -o $@ $^ 

# rule for generate libtoy.a
$(STATIC_LIB): $(LIB_OBJ)
	ar -rs $@ $^

# rule for generate libtoy.so
$(DYNAMIC_LIB): $(LIB_OBJ)
	$(CC) $(CFLAGS) -shared -o $(DYNAMIC_LIB) $(LIB_OBJ)

# rule for compiling main.c
$(MAIN_OBJ): $(MAIN_SRC)
	$(CC) $(CFLAGS) -c -o $@ $^ 

# rule for static link executable file
$(STATIC_MAIN): $(MAIN_OBJ) $(STATIC_LIB)
	$(CC) $(CFLAGS) -o $@ $^

# rule for dynamic link executable file
$(DYNAMIC_MAIN): $(MAIN_OBJ) $(DYNAMIC_LIB)
	$(CC) $(CFLAGS) -o $@ $^

static-lib: $(STATIC_LIB)

dynamic-lib: $(DYNAMIC_LIB)

static-main: $(STATIC_MAIN)

dynamic-main: $(DYNAMIC_MAIN)

# rule for launching gdb
gdb: $(STATIC_MAIN)
	gdb --args $^ 0 9

clean:
	rm $(DYNAMIC_MAIN) $(STATIC_MAIN) $(MAIN_OBJ) $(LIB_OBJ) $(STATIC_LIB) $(DYNAMIC_LIB) -rf

.PHONY: clean static-lib static-main dynamic-lib dynamic-main