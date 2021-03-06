#!/bin/bash
# Does task for scripting assignment.

#Declare variables and assign any default values.
#Define functions for error messages and displaying command line help.
  function displayhelp {
cat <<EOF
    Usage: $0 [-h | --help] [output options]
    Command options can be one or more of the following:

    -n | --nameinfo   =  get info about system name and domain name
    -i | --ipinfo     =  get ip interface information of the current device
    -o | --osinfo     =  get info about operating system, the OS name and version
    -c | --cpuinfo    =  get cpu description
    -m | --meminfo    =  get info about the ammount of memory installed on this device
    -d | --diskinfo   =  get info on the availible diskspace
    -p | --printinfo  =  get a list of printers install on the system
    -s | --softinfo   =  get a list of software installed on this device
EOF
  }

  function errormessage {
  echo "$@" >&2
}
  rundefault="yes"

#MY FABULAOUS FUNCTIONS

#This one is for the nameinfo
    function nameinfo {
      echo "Your Hostname is:"
      hostname -f
      echo "Your Domain name:"
      hostname -d
      echo ""
      echo "If blank, your computer is not on Domain"
    }
    nameinfowanted="yes"
    rundefault="no"

    #This next one is for the ipinfo stuffs
    function ipinfo {
      echo "Your network interfaces and IP info are listed below"
      echo ""
      ip addr
    }
    ipinfowanted="yes"
    rundefault="no"

    #Up and coming is a cute little function for operating system info (osinfo)
    function osinfo {
      echo "Your operating system version is:"
      grep "PRETTY" /etc/os-release | sed -e 's/.*=//'
    }
    osinfowanted="yes"
    rundefault="no"

    #An equally delightful function for cpu info
    function cpuinfo {
      echo "CPUs in sytem are:"
      grep "model" /proc/cpuinfo | sed -e 's/.*://'
    }
      cpuinfowanted="yes"
      rundefault="no"

    #This is a charming function that will help show you the total ammount
    #physical memory installed in your PC (or the ammount you allocated to your vm)
    #It's just that friendly :)
    function meminfo {
      echo "The amount of installed memory is:"
      awk '/^MemTotal:/' /proc/meminfo | sed 's/MemTotal:       //'
    }
      meminfowanted="yes"
      rundefault="no"

      #Here's annother function, it's equally as pleasant as the last
      function diskinfo {
        echo "Disk information for main partition is:"
        df -kBM /
      }
        diskinfowanted="yes"
        rundefault="no"

      #This function is a little dainty, but works none-the-less!
      function printinfo {
        echo "Using lpstat to display connected printers."
        echo "Connected printers are:"
        echo ""
        lpstat -p
      }
        printinfowanted="yes"
        rundefault="no"

        #Last but certainly not least~ a nice little software function
        #It will list all of the software and packages that are on your system :)
        function softinfo {
          echo "Below is a list of all installed software on this host"
          apt list --installed | more
        }
        softinfowanted="yes"
        rundefault="no"


#Process the command line options, saving the results in variables for later use.
#Gather the data into variables, using arrays where helpful.
#Create the output using the gathered data and command line options.
#Display the output.
#Do any cleanup of temporary files if needed.

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
          nameinfo
          exit 0
          ;;
      -i|--ipinfo)
          ipinfowanted="yes"
          rundefault="no"
          ipinfo
          exit 0
          ;;
      -o|--osinfo)
          osinfowanted="yes"
          rundefault="no"
          osinfo
          exit 0
          ;;
      -c|--cpuinfo)
          cpuinfowanted="yes"
          rundefault="no"
          cpuinfo
          exit 0
          ;;
      -m|--meminfo)
          meminfowanted="yes"
          rundefault="no"
          meminfo
          exit 0
          ;;
      -d|--diskinfo)
          diskinfowanted="yes"
          rundefault="no"
          diskinfo
          exit 0
          ;;
      -p|--printinfo)
          printinfowanted="yes"
          rundefault="no"
          printinfo
          exit 0
          ;;
      -s|--softinfo)
          softinfowanted="yes"
          rundefault="no"
          softinfo
          exit 0
          ;;
      *)
        displayhelp >&2
        exit 1
        ;;
  esac
  shift
done
