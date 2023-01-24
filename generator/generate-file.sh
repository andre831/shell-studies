#!/bin/sh


echo "Hello, what do you want to build:"

sleep 3

echo "[1] Node.js container " \ 
  echo "[2] Nginx container " \ 
  echo "[3] Apache container"

echo "Option: "

sleep 3

while :
do
    read OPTION
    case $OPTION in 
        1)
            . ./node-container.sh
            
            echo "Created Node app and Dockerfile..."

            sleep 3

            break 
            ;;

        2)
            echo "bbbb"
            ;;
    esac
done