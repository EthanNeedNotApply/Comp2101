#!/bin/bash

colours=("red" "green" "blue")
decrare -A animals
animals=([red]="bird" [green]="lizard" [blue]="lobster")

echo "My colours are ${colours[*]}"
echo "The animals array contains ${animals[0]} ${animals[1]} ${animals[2]}"
