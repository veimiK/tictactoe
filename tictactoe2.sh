#!/bin/bash
PLANSZA=(- - - - - - - - -)
player="0"
gamecheck=0
function plansza(){
echo "${PLANSZA[0]} ${PLANSZA[1]} ${PLANSZA[2]}"
echo "${PLANSZA[3]} ${PLANSZA[4]} ${PLANSZA[5]}"
echo "${PLANSZA[6]} ${PLANSZA[7]} ${PLANSZA[8]}"
}

function checkwin(){
i=0
while [ "$i" -le 8 ] #columns
do
	if [ "${PLANSZA[$i]}" = "1" ]  && [ "${PLANSZA[$i+1]}" = "1" ] && [ "${PLANSZA[$i+2]}" = "1" ] ; then
	echo "Wygrana jedynek!"
	gamecheck="1"
	fi

	if [ "${PLANSZA[$i]}" = "0" ]  && [ "${PLANSZA[$i+1]}" = "0" ] && [ "${PLANSZA[$i+2]}" = "0" ] ; then
	echo "Wygrana zer!"
	gamecheck="1"
	fi

	i=$((i+3))
done

while [ "$i" -le 3 ] #rows
do
	if [ "${PLANSZA[$i]}" = "0" ]  && [ "${PLANSZA[$i+3]}" = "0" ] && [ "${PLANSZA[$i+6]}" = "0" ] ; then
	echo "Wygrana zer!"
	gamecheck="1"
	fi

	if [ "${PLANSZA[$i]}" = "1" ]  && [ "${PLANSZA[$i+3]}" = "1" ] && [ "${PLANSZA[$i+6]}" = "1" ] ; then
	echo "Wygrana jedynek!"
	gamecheck="1"
	fi
	i=$((i+1))
done

#diagonal
if [ "${PLANSZA[0]}" = "1" ]  && [ "${PLANSZA[4]}" = "1" ] && [ "${PLANSZA[8]}" = "1" ] ; then
echo "Wygrana jedynek!"
gamecheck="1"
fi

if [ "${PLANSZA[2]}" = "1" ]  && [ "${PLANSZA[4]}" = "1" ] && [ "${PLANSZA[6]}" = "1" ] ; then
echo "Wygrana jedynek!"
gamecheck="1"
fi

if [ "${PLANSZA[0]}" = "0" ]  && [ "${PLANSZA[4]}" = "0" ] && [ "${PLANSZA[8]}" = "0" ] ; then
echo "Wygrana zer!"
gamecheck="1"
fi

if [ "${PLANSZA[2]}" = "0" ]  && [ "${PLANSZA[4]}" = "0" ] && [ "${PLANSZA[6]}" = "0" ] ; then
echo "Wygrana zer!" 
gamecheck="1"
fi
}

function put(){
echo "Tura gracza $player."
read id
	if [ "${PLANSZA[id]}" = "1" ] || [ "${PLANSZA[id]}" = "0" ] ; then
		echo "Na tym polu został już wykonany ruch."
	else
		PLANSZA["$id"]="$player"
	fi
}

function playerchange(){

	if [ "$player"="0" ] ; then
		player="1"
	else
		player="0"
	fi

}

while [ "$gamecheck" = 0 ] ; do
plansza
put
playerchange
checkwin
done
