#!/bin/bash

function showArgs
{
  local i=0
  for arg in "$@" ; do
    echo "Arg[$i]: $arg"
    i=$(($i+1))
  done
}

function test_array
{
  myArray=("this is a test" "Another" "Hello World")
  myArray+=("YO")

  showArgs "${myArray[@]}"
}

# forward parameters

function test_forward_parameters
{
  showArgs -Wall "$@"
}

test_forward_parameters "my file.cpp" "hello.cpp"

test_array

