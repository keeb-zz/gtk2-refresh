GCC=gcc
CFLAGS=-O2 -Wall $(shell pkg-config --cflags gtk+-2.0)
LIBS = $(shell pkg-config --libs gtk+-2.0)
SRC_DIR=src
BIN_DIR=bin
PYTHON=-I/usr/include/python2.6 

all: ${SRC_DIR}/gtk2refresh.c
	${GCC} -fpic -c ${SRC_DIR}/gtk2refresh.c ${CFLAGS} ${LIBS} ${PYTHON} \
	   	-o ${BIN_DIR}/gtk2refresh.o
	${GCC} ${BIN_DIR}/gtk2refresh.o -fpic -shared ${CFLAGS} ${LIBS} -o ${BIN_DIR}/gtk2refresh.so


clean:
	rm ${BIN_DIR}/*

t:
	sh test
