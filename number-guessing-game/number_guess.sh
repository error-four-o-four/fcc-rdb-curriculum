#!/bin/bash

PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

FORMAT() {
  echo $1 | sed -E 's/^ *| *$//'
}

### ENTRY

echo "Enter your username:"

read USER_NAME

### DISPLAY WELCOME

USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE name = '$USER_NAME'")

if [[ -z $USER_DATA ]]
then
  # display default welcome message
  echo "Welcome, $USER_NAME! It looks like this is your first time here."

else
  # display custom welcome message
  echo "$USER_DATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    GAMES_PLAYED=$( FORMAT "$GAMES_PLAYED" )
    BEST_GAME=$( FORMAT "$BEST_GAME" )

    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

  done

fi



### HANDLE INSERT - called when number was guessed correctly

INSERT_DATA() {
  USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE name = '$USER_NAME'")

  if [[ -z $USER_DATA ]]
  then
    # insert initial data
    INSERT_DATA=$($PSQL "INSERT INTO users(name, games_played, best_game) VALUES('$USER_NAME', 1, $ATTEMPTS)")

  else
    # insert new data
    echo "$USER_DATA" | while IFS="|" read USER_ID LAST_GAMES_PLAYED LAST_BEST_GAME
    do
      GAMES_PLAYED=$(( LAST_GAMES_PLAYED + 1))
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID")

      if [[ $LAST_BEST_GAME -gt $ATTEMPTS ]]
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $ATTEMPTS WHERE user_id = $USER_ID")

      fi

    done

  fi
}



### GAME LOGIC

ATTEMPTS=1
SECRET_NUMBER=$(( 1 + $RANDOM % 1000 ))

HANDLE_NUMBER() {
  if [[ $GUESSED_NUMBER -eq $SECRET_NUMBER ]]
  then
    # display message
    echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"

    # finish
    INSERT_DATA

    # exit
    exit 0

  fi

  ATTEMPTS=$(( $ATTEMPTS + 1 ))

  if [[ $GUESSED_NUMBER -lt $SECRET_NUMBER ]]
  then
    # display less
    echo "It's higher than that, guess again:"

    # read again
    READ_NUMBER

  else
    # display greater
    echo "It's lower than that, guess again:"

    # read again
    READ_NUMBER

  fi
}

READ_NUMBER() {
  read GUESSED_NUMBER

  if [[ ! "$GUESSED_NUMBER" =~ ^-?[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    READ_NUMBER

  else
    HANDLE_NUMBER
  fi
}

### START GAME

echo "Guess the secret number between 1 and 1000:"

READ_NUMBER
