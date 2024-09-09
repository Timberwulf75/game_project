#!/bin/bash

#William Yonce 10/08/2022

#I would like to give Thanks and Credit for this Gaming Project to: 
#NetworkChuck from YouTube. He showed how to create a game using Bash,
#and I took it and studied and wrote this game from watching his amazing 
#YouTube Channel, everyone should check it out and follow him for
#Learning and great content. 

# Function for starting the game

start_game() {
	echo "     "
	echo " Game Project "
	echo "     "
	while true; do

	# Asking the player if they would like to play the game
	
	read -p -r "Would you like to play a game? (y/n) " yn

	# Working out if the player said yes or no
	
	case $yn in
			[yY] ) echo "Ok, we will proceed. ";
					break;;
			[nN] ) echo "Exiting... have a great day! ";
					exit;;
			* ) echo "Invalid response, please try again. ";;
	esac

	done
	
	echo "    "
	echo Loading ......
	echo "    "
}

# Function to choose character

choose_character() {

	while true; do  # Start a loop that will continue until a valid choice is made
	 
		# Welcoming the player to the game and allowing player to choose their character
	
		echo "Welcome Tarnished. Time to Select Your Character Class:

				1: - Warrior
				2: - Prisoner
				3: - Wizard"

		read -r class

		case $class in

			1)
					type="Warrior"
					hp=20
					attack=30
					break  # Exit the loop once a valid choice is made
					;;
			2)
					type="Prisoner"
					hp=10
					attack=5
					break  # Exit the loop once a valid choice is made
					;;
			3)
					type="Wizard"
					hp=20
					attack=15
					break  # Exit the loop once a valid choice is made
					;;
			*)
        			echo "Invalid class selection. Please choose 1, 2, or 3. "
        			# Loop will continue if an invalid selection is made
					;;
		esac
	done

	# Telling the player their choice for their character
	
	echo "    "
	echo "You have chosen the $type Class. Here is a list of your Stats:
					
						HP = $hp
						AT = $attack"
					
	# Ask the player to name their character

	echo "     "
	echo "What is your name, brave $type? "
	read -r character_name

	# Use of the Variable character_name
	
	echo "Ah, welcome $character_name! Prepare for your adventure! "
}

# Function for the first beast battle

beast_battle() {

	# First Beast Battle
	
	# Randomly generate a beast encounter (0 or 1)
	
	beast=$(( RANDOM % 2 ))

	# Description of the scene

	echo "     "
	echo "While walking through the woods, $character_name hears noise coming from the bushes ahead along the path. "
	echo "     "

	# Loop until the player makes a valid choice
	
	while true; do 

		read -p -r  "Do you run away or stand your ground? (run away/stand your ground) " Choice

		case "$Choice" in
	
			"run away" ) 
				echo "You decide to run away, escaping into the shadows. The beast does not follow. "
				break # Exit the loop if they choose to run away
		
				;;
	
			"stand your ground" )
				echo "You stand your ground, $character_name prepare for your first battle! "
				while true; do
					echo "Pick a number between 0 and 1. (0,1)"
					read -r tarnished
					if [[ "$tarnished" =~ ^[0-1]$ ]]; then
						if [[ $beast == "$tarnished" ]]; then
								echo "Beast VANQUISHED!! Congratulations $character_name for vanquishing your first beast! "
						else
								echo "YOU DIED"
								exit 1
						fi
						break
					else
						 echo "Invalid input. Please pick a number between 0 and 1."
					fi
				done
				;;
		esac
	done
        }

# Function for the dragon battle

dragon_battle() {

	sleep 2

	echo "   "
	echo "$character_name continues along the path and comes to a large clearing. "
	echo "   "
	echo "In the sky $character_name can make out a large flying shadow figure"
	echo "   "
	echo "It gets closer, and $character_name sees more clearly that it is GrandFangal, the legendary Dragon. "
	echo "   "
	echo "The beast lands and now its a fight for life and death.GrandFangal cut off all ways to escape. 
		the only thing to do is fight. "
		
	beast=$(( RANDOM % 10 ))
	
	while true; do
		# Ask the player to pick a number between 0 and 9
		
		read -p -r  "Pick a number between 0 and 9. (0,9) " tarnished
		
		# Check if input is a valid number (0-9)
		
		if [[ "$tarnished" =~ ^[0-9]$ ]]; then
			if [[ $beast == "$tarnished" || $tarnished == 'potion' ]]; then
				if [[ $USER == "root" ]]; then
						echo "BOSS VANQUISHED!!!!!! "
				else
						echo "YOU DIED"
						exit 1
				fi
			else
    			echo "YOU DIED"
    			exit 1
			fi
			break
		else
			echo "Invalid input. Please pick a number between 0 and 9."
		fi
	done
}

# Function to handle replay

end_game() {

	# Ask the player if they want to play again

	read -p -r  "Would you like to play again? (y/n) " play_again

	case $play_again in
		[yY] ) exec "$0" ;; # Restarts the script
		[nN] ) echo "Thank you for playing! Goodbye! "; 
				exit ;;
		* ) echo "Invalid response, exiting.... ";
				sleep 2
				exit ;;
	esac
}

# Main game flow
start_game
choose_character
beast_battle
dragon_battle
end_game