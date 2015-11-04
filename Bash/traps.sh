#!/bin/bash
set -e

function main
{
  # register error handler
  trap 'cleanup' EXIT

  # generate an error
  failSomething

  # unregister error handler
  trap - EXIT

  echo "Success"
}

function cleanup
{
  echo "Cleaning up temporary files ..."
}

function failSomething
{
  return 7
}

main
