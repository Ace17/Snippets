all: yo.exe

yo.exe: implem.o implem2.o
	g++ -o "$@" $^

%.o: %.cpp
	g++ -c -o "$@" $^

clean:
	rm -f *.exe *.o
