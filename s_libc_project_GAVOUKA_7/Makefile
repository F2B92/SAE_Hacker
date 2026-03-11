CC = gcc
CFLAGS = -m32 -fPIC
SRC = src/s_string.s src/s_math.s src/s_stdio.s
OBJ = build/s_string.o build/s_math.o build/s_stdio.o
TARGET = lib/libs_libc.so
TESTPROG = testprog

all: $(TARGET)

$(TARGET): $(OBJ)
	mkdir -p lib
	$(CC) -m32 -shared -o $(TARGET) $(OBJ)

build/s_string.o: src/s_string.s
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

build/s_math.o: src/s_math.s
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

build/s_stdio.o: src/s_stdio.s
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

test: all
	$(CC) -m32 test/main.c -L./lib -ls_libc -Wl,-rpath=./lib -o $(TESTPROG)

clean:
	rm -rf build/*.o

fclean: clean
	rm -rf $(TARGET) $(TESTPROG)

re: fclean all

install: all
	cp $(TARGET) /usr/lib/
