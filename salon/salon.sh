#!/bin/bash

PSQL="psql -X -U freecodecamp -d salon --tuples-only -c"

NAN() {
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    echo true
  else
    echo false
  fi
}

# GET_SERVICES() {
#   echo "$($PSQL "SELECT * FROM services ORDER BY service_id")"
# }

FORMAT() {
  echo $1 | sed -E 's/^ *| *$//'
}

MAIN_MENU() {
  if [[ -z $1 ]]
  then
    echo -e "Welcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1\n"
  fi

  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # invalid input
    MAIN_MENU "I could not find that service. What would you like today?"

  else
    # get service
    SERVICE_NAME=$(FORMAT "$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")")

    # get user
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$(FORMAT "$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")")

    if [[ -z $CUSTOMER_NAME ]]
    then
      # no user found
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERTED=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    fi

    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")

    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    INSERTED=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"

  fi
}

### MAIN

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU