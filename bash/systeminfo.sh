#!/bin/bash
# Does task for scripting assignment.

#Declare variables and assign any default values.
#Define functions for error messages and displaying command line help.
#Process the command line options, saving the results in variables for later use.
#Gather the data into variables, using arrays where helpful.
#Create the output using the gathered data and command line options.
#Display the output.
#Do any cleanup of temporary files if needed.

while [ $# -gt 0 ]; do
    case "$1 in"
      -h|--help)
      echo "Usage: $0 [-h | --help]"
      exit 0
      ;;
    *)
      echo "Oops! I don't recognize '$1'." >&2
      echo "Usage: $0 [-h | --help]" >&2
      exit 1
      ;;
  esac
  shift
done
