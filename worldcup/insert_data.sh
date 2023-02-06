#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


GET_TEAM_ID() {
  echo $($PSQL "SELECT team_id FROM teams WHERE name='$1'")
}

INSERT_TEAM() {
  INSERTED=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
}


# insert teams

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # skip titles
  if [[ $YEAR != year ]]
  then
    # test
    echo -e "\n$YEAR $ROUND: $WINNER vs. $OPPONENT ($WINNER_GOALS : $OPPONENT_GOALS)"

    # get winner id
    WINNER_ID=$(GET_TEAM_ID "$WINNER")

    # not found
    if [[ -z $WINNER_ID ]]
    then
      # insert
      INSERT_TEAM "$WINNER"

      # get
      WINNER_ID=$(GET_TEAM_ID "$WINNER")
    fi

    OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")

    # not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert
      INSERT_TEAM "$OPPONENT"

      # get
      OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")
    fi

    echo -e "$WINNER: $WINNER_ID - $OPPONENT: $OPPONENT_ID"

    $PSQL "INSERT INTO games(year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_ID, $OPPONENT_GOALS)"

  fi

done

echo -e "\n"