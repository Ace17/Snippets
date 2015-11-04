all: toto.exe

COMPILER=gcc -std=c++11

superFile:
	seq 1 10 > superFile

superFile2:
	@echo "Making superfile cool"
	seq 1 10 > "$@"
	-exit 7

superFile3: superFile2
	cat "$<" | sed "s/^/hello: /" > "$@"

%.o: %.c
	$(COMPILER) -c -o "$@" "$<"

%.dep: %.c
	gcc -MM "$^" > "$@"

SRCS:=\
	toto.c\
	hardy.c\
	laurel.c\

DEPS:=$(SRCS:%.c=%.dep)

debug:
	echo DEPS=$(DEPS)

all_deps: $(DEPS)
	cat $^ > "$@"

include all_deps

toto.exe: toto.o hardy.o laurel.o
	$(COMPILER) -o "$@" $^

