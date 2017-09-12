#!/bin/bash
# This is a scriptto practice variables

export MYNAME="Ethan"
mytitle="President"
# echo $

weekday=$(date +%A)
myhostname=$(hostname)


echo "Welcome to Planet $myhostname, $mytitle $MYNAME"
echo "Today is $weekday"
