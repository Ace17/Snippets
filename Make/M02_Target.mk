all: /tmp/myFile.txt /tmp/myFile2.txt

/tmp/myFile.txt:
	echo "Hello, world" > /tmp/myFile.txt

/tmp/myFile2.txt:
	echo "Hello, another world" > "$@"
