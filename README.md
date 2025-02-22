# CS110 Discussion2 for Spring Semester 2025

This repository contains the source code used in the discussion sessions

## Usage 
There are six Makefile phony target you can use

- generate static lib: libtoy.a 
```bash
make static-lib 
```

- generate dynamic lib: libtoy.so 
```bash
make dynamic-lib 
```

- generate executable program `range_sum` with static lib
```bash
make static-main 
```

- generate executable program `range_sum` with dynamic lib
```bash
make dynamic-main 
```

- start gdb for static linked `range_sum` with argument `0 9`
```bash
make gdb
```

- remove reproduceable file under current directory
```bash
make clean
```