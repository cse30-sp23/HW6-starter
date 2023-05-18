#
# CSE30 Makefile
#
# we declare the object we want to build in the variable EXE
# we list the objects we want to compile (from c) in OBJS
#
# we provide a phony target clean to rm all the .o files
#

EXE = fpconvert
SRC = main.c fpconvert.s
OBJS = main.o fpconvert.o
LIBS =
CC = gcc
DEBUG = -g
WARN = -Wall -Wextra
CFLAGS = -I. -std=gnu11 $(DEBUG) $(WARN)

AS = gcc
ASLIST = -Wa,-adhln
ASFLAGS = -I.

%.o : %.s
	$(AS) -c $(ASFLAGS) $(DEBUG) $< -o $@

.PHONY: clean

$(EXE) : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $@

clean :
	rm -rf $(OBJS) $(EXE) makebin

makebin :
	$(CC) $(CFLAGS) makebin.c -o makebin
