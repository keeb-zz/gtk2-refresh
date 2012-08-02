GCC=g++
CFLAGS=-O2 -Wall $(shell pkg-config --cflags gtk+-2.0)
LIBS = $(shell pkg-config --libs gtk+-2.0)
SRC_DIR=src/
BIN_DIR=bin/
PYTHON=-I/usr/include/python2.6 

all: refresh.c
	${GCC} -fpic -c ${SRC_DIR}/refresh.c ${CFLAGS} ${LIBS} ${PYTHON} \
	   	-o ${BIN_DIR}/refresh.o
	${GCC} ${BIN_DIR}/refresh.o -fpic -shared ${CFLAGS} ${LIBS} -o ${BIN_DIR}/refresh.so


	

clean:
	rm bin/refresh.o
	rm bin/refresh.so

