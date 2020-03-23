#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

declare -A dictionary

#flipping coin to display head or tail
#flipping coin multiple times and store the singlet,doublet & triplet combination in a dictonary

function flipcoin() {
	for (( index=0; index<$1; index++ ))
  	do
  		Count=0
		for (( index1=0; index1<$2; index1++ ))
   	do
    		Number=$(( RANDOM%2 ))
    		if [[ $Number -eq 1 ]]
    		then
       		totalCount+=H
    		else
       		totalCount+=T
    		fi
		done
  		dictionary[$Count]=$(( ${dictionary[$Count]}+1 ))
	done
	echo "Count of all combination: ${dictionary[@]}"
	echo "keys                      ${!dictionary[@]}"
}

#function for percentage of singlet,doublet and triplet combination
function percentageFlipCoin() {
	for var in ${!dictionary[@]}
	do
		dictionary[$var]=$( echo "scale=2;$((${dictionary[$var]}))/$coins*100" | bc )
	done
}

echo  "How many times you want to flip a coin?"
read coins
echo  "Press 1 for singlet combination or Press 2 for doublet combination Press 3 for triplet combination"
read choice

case $choice in
	1)
		flipcoin $coins $choice
		percentageFlipCoin
		echo "Percentage of singlet combination: ${dictionary[@]}"
	;;
	2)
		flipcoin $coins $choice
		percentageFlipCoin
		echo "Percentage of doublet combination: ${dictionary[@]}"
	;;
	3)
		flipcoin $coins $choice
		percentageFlipCoin
		echo "Percentage of Triplet combination: ${dictionary[@]}"
	;;
	*)
 	 echo "wrong input"
	;;
esac
