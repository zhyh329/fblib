CC=gcc -Wall -pedantic -std=c99 -O3
FLAGS=

ifeq (${DEBUG}, 1)
	FLAGS=-g -DDEBUG
endif

all: info fblib.a fbgrad

%.a: %.o
	ar rcs $@ $<

%.o: %.c %.h
	${CC} ${FLAGS} ${OPTS} -c $< -o $@

fbgrad: fblib.a fbgrad.o
	${CC} ${FLAGS} ${OPTS} $^ -o $@


info:
	@echo "CC	= ${CC}"
	@echo "FLAGS	= ${FLAGS}"
	@echo

clean:
	rm fbgrad fblib.a fbgrad.o

rebuild: clean all

.PHONY: all clean rebuild
