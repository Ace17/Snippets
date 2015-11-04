#!/bin/bash

echo "For loop 1"
for i in 1 2 3 ; do
  echo $i
done

echo "For loop 2"
for i in $(seq 1 10); do
  echo $i
done

echo "while loop 1"
i=0
while [ $i -lt 10 ] ; do
  echo $i
  i=$(($i+1))
done

echo "while loop 2"
i=0
while true ; do
  if [ $i -gt 10 ] ; then
    break
  fi
  echo $i
  i=$(($i+1))
done

echo "piped while loop"
seq 1 10 | while read n ; do
  echo $n
done

