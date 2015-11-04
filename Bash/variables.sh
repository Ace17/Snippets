#!/bin/bash

if [ -n "${WHATEVER-}" ]
then
  echo 'not empty'
elif [ "${WHATEVER+defined}" = defined ]
then
  echo 'empty but defined'
else
  echo 'unset'
fi

# define to g++ if not set
CXX=${CXX-g++}
