all: OS_Assignment0
	./OS_Assignment0
	rm -f *.out *.o OS_Assignment0

OS_Assignment0: OS_Assignment0.o
	gcc -o OS_Assignment0 OS_Assignment0.o

OS_Assignment0.o: OS_Assignment0.asm
	yasm -f elf64 OS_Assignment0.asm
