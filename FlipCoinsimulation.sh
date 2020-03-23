#!/bin/bash -x

printf "Welcome to Flip Coin Simulation \n"

#flipping coin to display head or tail

Number=$(( RANDOM%2 ))
if [[ $Number -eq 1 ]]
then
	printf "Head \n"
else
	printf "Tail \n"
fi
