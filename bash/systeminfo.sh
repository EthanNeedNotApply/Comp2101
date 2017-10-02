#!/bin/bash
# Does task for scripting assignment.

#Declare variables and assign any default values.
#Define functions for error messages and displaying command line help.
function displayhelp {
  cat <<EOF
  Usage: $0 [-h | --help] [output options]
  Command options can be one or more of the following
  -n | --nameinfo =
  -i | --ipinfo =
  -o | --osinfo =
  -c | --cpuinfo =
  -m | --meminfo =
  -d | --diskinfo =
  -p | --printinfo =
  -s | --softinfo = 
EOF
}

function errormessage {
  echo "$@" >&2
}
#Process the command line options, saving the results in variables for later use.
#Gather the data into variables, using arrays where helpful.
#Create the output using the gathered data and command line options.
#Display the output.
#Do any cleanup of temporary files if needed.

rundefault="yes"

while [ $# -gt 0 ]; do
    case "$1" in
      -h|--help)
        displayhelp
        exit 0
        ;;
        #list of options var after this line
      -n|--nameinfo)
          nameinfowanted="yes"
          rundefault="no"
          ;;
      -i|--ipinfo)
          ipinfowanted="yes"
          rundefault="no"
          ;;
      -o|--osinfo)
          osinfowanted="yes"
          rundefault="no"
          ;;
      -c|--cpuinfo)
          cpuinfowanted="yes"
          rundefault="no"
          ;;
      -m|--meminfo)
          meminfowanted="yes"
          rundefault="no"
          ;;
      -d|--diskinfo)
          diskinfowanted="yes"
          rundefault="no"
          ;;
      -p|--printinfo)
          printinfowanted="yes"
          rundefault="no"
          ;;
      -s|--softinfo)
          softinfowanted="yes"
          rundefault="no"
          ;;
      *)
        displayhelp >&2
        exit 1
        ;;
  esac
  shift
done
