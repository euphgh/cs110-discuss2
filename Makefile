toy.o: toy.c
	gcc toy.c -g -Og -c -fpic -o toy.o

libtoy.a: toy.o
	ar -rs libtoy.a toy.o

libtoy.so: toy.o
	gcc -g -Og -shared -o libtoy.so toy.o

main.o: main.c
	gcc main.c -g -Og -c -o main.o

range_sum_d: main.o libtoy.so
	gcc -g -Og -o range_sum_d main.o libtoy.so

range_sum_s: main.o libtoy.a
	gcc -g -Og -o range_sum_s main.o libtoy.a

static-lib: libtoy.a

dynamic-lib: libtoy.so

static-main: range_sum_s

dynamic-main: range_sum_d

gdb: range_sum_s
	gdb --args range_sum_s 0 9

clean:
	rm range_sum_d range_sum_s libtoy.so libtoy.a toy.o main.o -rf

.PHONY: clean static-lib static-main dynamic-lib dynamic-main