#!/bin/bash

# Chemin vers le répertoire
games_dir="./games"

# Afficher les jeux disponibles
echo "Jeux disponibles :"
games=$(ls "$games_dir")

# Afficher les jeux dans un menu numéroté
select game in $games; do
    if [ ! -z "$game" ]; then
        echo "Vous avez choisi $game."
        cd "$games_dir" || exit 1
        # Assurez-vous que start.sh est exécutable
        chmod +x "$game/adventure.sh"
        # Exécuter start.sh du jeu sélectionné
	cd ./$game/
	./adventure.sh
        break
    else
        echo "Choix invalide. Veuillez choisir un numéro de jeu valide."
    fi
done
