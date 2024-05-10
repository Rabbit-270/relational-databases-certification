#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\n~~ Entering data into the database ~~\n"
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
# Check if YEAR != 'year' so that if it is you, you enter the
# data into the database

# This if-statement is used to enter all the teams into the database.
if [[ $YEAR -ne "year" ]]
then
  # Find out if the WINNER team is already in the database or not
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  if [[ -z $WINNER_ID ]]
  then
    # insert the winner team. It is not in the database
    WINNER_INSERT_RESPONSE=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    echo "Inserting $WINNER into teams table. Result => $WINNER_INSERT_RESPONSE"
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'") # Updates the winner_id so that it does not remain empty.
  fi

  # Find out if the OPPONENT team is already in the database or not
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  if [[ -z $OPPONENT_ID ]]
  then
    # insert the opponent team
    OPPONENT_INSERT_RESPONSE=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    echo "Inserting $OPPONENT into teams table. Result => $OPPONENT_INSERT_RESPONSE."
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") # Updates the opponent_id so that it does not remain empty.
  fi

  # **** In this part we enter the games data ****
  GAMES_INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND',$WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
fi
#end of script
done
