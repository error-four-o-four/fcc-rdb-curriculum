#!/bin/bash

PSQL="psql -U freecodecamp -d periodic_table -t --no-align -c"

FORMAT() {
  echo $1 | sed -E 's/^ *| *$//'
}

if [[ -z $1 ]]
then
  # no argument
  echo -e "Please provide an element as an argument."

else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # argument is number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")

  else
    # argument is not a number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")

  fi

  # get element
  if [[ -z $ATOMIC_NUMBER ]]
  then
    # not found
    echo -e "I could not find that element in the database."

  else
    # get data
    DATA=$($PSQL "SELECT symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
      FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)
      WHERE atomic_number = $ATOMIC_NUMBER;")

    echo "$DATA" | while IFS="|" read SYMBOL NAME TYPE MASS MELTING BOILING
    do

      ATOMIC_NUMBER=$(FORMAT $ATOMIC_NUMBER)
      SYMBOL=$(FORMAT $SYMBOL)
      NAME=$(FORMAT $NAME)
      MASS=$(FORMAT $MASS)
      MELTING=$(FORMAT $MELTING)
      BOILING=$(FORMAT $BOILING)

      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done

  fi

fi
