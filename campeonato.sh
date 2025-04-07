#!/bin/bash

# Contador de victorias/empates de los corredores
corredor1=0
corredor2=0
empates=0

# Pantalla inicial del campeonato
clear
echo "🏆 Bienvenido al Campeonato Mundial de Carreras 🏆"
echo ""

# Preguntamos cuántas carreras quiere disputar el usuario
read -p "¿Cuántas carreras quieres disputar? " num_carreras

# Bucle para ejecutar las carreras
for ((carrera=1; carrera<=num_carreras; carrera++)); do
    echo ""
    echo "➡️ Carrera $carrera de $num_carreras"             #Muestra en qué carrera estamos
    sleep 1

    # Ejecutamos carrera.sh
    ./carrera.sh                    #Simulación carrera y resultado en resultado.tmp

    # Leemos el resultado (guardamos resultado en var resultado)
    resultado=$(cat resultado.tmp)

    # Sumamos 1 al contador dependiendo del resultado
    if [ "$resultado" = "Corredor 1" ]; then
        corredor1=$((corredor1 + 1))
    elif [ "$resultado" = "Corredor 2" ]; then
        corredor2=$((corredor2 + 1))
    else
        empates=$((empates + 1))
    fi

    rm resultado.tmp            #Elimino archivo temporal para evitar mezclarlo con siguientes carreras
    sleep 2
done

# Mostrar resultados finales
clear
echo "📊 Resultados finales del campeonato:"
echo ""
echo "🏃‍♂️ Corredor 1: $corredor1 victorias"
echo "🏃‍♀️ Corredor 2: $corredor2 victorias"
echo "🤝 Empates: $empates"
echo ""

# Determinar el campeón
if [ "$corredor1" -gt "$corredor2" ]; then                  #cor1 > cor2
    campeon="Corredor 1"
    echo "🏆 ¡El campeón del torneo es Corredor 1!"
elif [ "$corredor2" -gt "$corredor1" ]; then
    campeon="Corredor 2"
    echo "🏆 ¡El campeón del torneo es Corredor 2!"
else
    campeon="Empate"
    echo "🤝 ¡El torneo termina en empate!"
fi

sleep 3

# 🎆 FUNCIÓN ANIMACIÓN DE FUEGOS ARTIFICIALES 🎆
firework() {
    for ((i=1; i<=10; i++)); do                   #Cuanto mayor es i, más alto parece que sube el cohete
        clear
        # Simulación de subida del cohete
        for ((j=0; j<i; j++)); do                 #Imprime líneas vacías para mayor realismo al desplazamiento

            echo
        done
        echo "        |"
        echo "        |"
        echo "       / \\"                        #Carácteres ASCII
        echo "      /___\\"
        echo "        *"
        sleep 0.1
    done

    # Explosión grande
    for ((k=0; k<4; k++)); do                      #Repite 4 veces la explosión
        clear
        echo "        BOOOOM!"
        echo "         .''.       *''*    :_\/_:     . "
        echo "        :_\/_:   _\(/_  .:.*_\/_*.  : /\ :  .'.:.'."
        echo "        : /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-"
        echo "         '..'  ':::'     *..*         :"
        echo "             *            *..*         :"
        sleep 0.4
        clear
        sleep 0.2
    done
}

# Hacemos varios fuegos artificiales con pausa
firework
sleep 1
firework
sleep 1
firework

sleep 3
