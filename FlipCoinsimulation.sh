#!/bin/bash -x

printf "Welcome to Flip Coin Simulation \n"

printf "How many times you to want flip a coin? \n"
read count

declare -A result

#flipping coin to display head or tail
#flipping coin multiple times and store the singlet combination in a dictonary

headCount=0
tailCount=0

for (( index=0; index<$count; index++ ))
do
	Number=$(( RANDOM%2 ))
	if [[ $Number -eq 1 ]]
	then
		printf "Head \n"
	else
		printf "Tail \n"
	fi
done
#Storing the result in dictionary
result[H]=$headCount
result[T]=$tailCount

#Computing Percentage of heads and Tail
percentageOfHeads=( echo "scale=2;$headCount/$count*100" | bc )
percentageOfTails=( echo "scale=2;$tailCount/$count *100" | bc )

printf "Percentage of heads: $percentageOfHeads \n"
printf "Percentage of tails: $percentageOfTails \n"
