#!/bin/bash

# Define functions to start and stop each server
start_server() {
  cd /workspaces/eagler_1.8/server
  sudo java -jar server.jar
}

start_bungee() {
  cd /workspaces/eagler_1.8/bungee
  sudo java -jar bungee.jar
}

stop_server() {
  cd /workspaces/eagler_1.8/server
  sudo java -jar server.jar stop
}

stop_bungee() {
  cd /workspaces/eagler_1.8/bungee
  sudo pkill -f bungee.jar
}

# Define a function to start both servers
start_all() {
  start_server &
  start_bungee &
}

# Define a function to stop both servers
stop_all() {
  stop_server
  stop_bungee
}

# Print usage instructions
usage() {
  echo "Usage: $0 [start|stop]"
}

# Check the number of arguments
if [ $# -ne 1 ]; then
  usage
  exit 1
fi

# Handle the start/stop command
case $1 in
  start)
    start_all
    ;;
  stop)
    stop_all
    ;;
  *)
    usage
    exit 1
    ;;
esac
