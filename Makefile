CC := gcc
LIB_NAME := toy
STATIC_LIB := lib$(LIB_NAME).a
DYNAMIC_LIB := lib$(LIB_NAME).so

MAIN_SRC := main.c
MAIN_OBJ := main.o
MAIN_EXE := main

LIB_SRC := toy.c
LIB_OBJ := toy.o

$(LIB_OBJ): $(LIB_SRC)
	$(CC) $^ -c -fpic -o $@

$(STATIC_LIB): $(LIB_OBJ)
	ar -rs $@ $^

$(MAIN_OBJ): $(MAIN_SRC)
	$(CC) $^ -c -o $@

static-lib: $(STATIC_LIB)

dynamic-lib: $(DYNAMIC_LIB)

static-main: $(MAIN_OBJ) $(STATIC_LIB)
	$(CC) -o $(MAIN_EXE) $^

$(DYNAMIC_LIB): $(LIB_OBJ)
	$(CC) -shared -o $(DYNAMIC_LIB) $(LIB_OBJ)

dynamic-main: $(MAIN_OBJ) $(DYNAMIC_LIB)
	$(CC) -o $(MAIN_EXE) $^

clean:
	rm $(MAIN_EXE) $(MAIN_OBJ) $(LIB_OBJ) $(STATIC_LIB) $(DYNAMIC_LIB) -rf