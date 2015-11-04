all: hello.exe

hello.exe: hello.cpp
	g++ -o hello.exe hello.cpp

hello.cpp:
	echo "#include <iostream>" > hello.cpp
	echo "int main() { std::cout << \"Hello, world\" << std::endl; }" >> hello.cpp

