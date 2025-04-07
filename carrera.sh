#!/bin/bash

# Configuración inicial
pista=30            #Espacios
pos_corredor1=0
pos_corredor2=0

# Variables para almacenar el resultado de esta carrera
ganador=""

# Inicio de la carrera
clear
echo "🏁 ¡Nueva carrera en el campeonato! 🏃‍♂️🏃‍♀️"
sleep 1
echo "Preparando a los corredores..."
sleep 1
echo "Listos..."
sleep 1
echo "¡YA!"
sleep 1

# Animación de la carrera
while [ "$pos_corredor1" -lt "$pista" ] && [ "$pos_corredor2" -lt "$pista" ]; do        #pos < long pista
    clear
    echo -e "\e[1;33m🏁 Carrera de corredores 🏁\e[0m"      #Título en amarillo y reseteo
    echo ""

    # Corredor 1
    for ((i=0; i<pos_corredor1; i++)); do
        echo -n " "
    done
    echo -e "\e[1;34m🏃‍♂️ Corredor 1\e[0m"                     #Título en azul y reseteo

    # Corredor 2
    for ((i=0; i<pos_corredor2; i++)); do
        echo -n " "
    done
    echo -e "\e[1;35m🏃‍♀️ Corredor 2\e[0m"                     #Título en magenta y reseteo

    # Avance (espacios), número aleatorio entre 0 y 2
    avance1=$(( RANDOM % 3 ))
    avance2=$(( RANDOM % 3 ))

    # Actualizamos posiciones con avances
    pos_corredor1=$((pos_corredor1 + avance1))
    pos_corredor2=$((pos_corredor2 + avance2))

    sleep 0.2       #Pausa para ajustar velocidad
done

echo ""

# Determinar ganador
if [ "$pos_corredor1" -ge "$pista" ] && [ "$pos_corredor2" -ge "$pista" ]; then     #pos >= long pista
    echo "🤝 ¡Empate!"
    ganador="Empate"
elif [ "$pos_corredor1" -ge "$pista" ]; then
    echo "🏆 ¡Corredor 1 gana!"
    ganador="Corredor 1"
else
    echo "🏆 ¡Corredor 2 gana!"
    ganador="Corredor 2"
fi

sleep 2

# Devolvemos solo el resultado final sin que se duplique
echo "$ganador" > resultado.tmp         #Creo archivo temporal y escribe dentro valor variable ganador


