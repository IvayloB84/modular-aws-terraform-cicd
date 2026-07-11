#!/bin/bash
health=$(curl --location 'localhost:8080/actuator/health')
pids=$( pgrep -n 'java|8080' )
status=$( jq -r '.status?' health)
if $health &&
   [ "$status" != "UP" ] 
then
if [ -n "$pids" ]
then
  kill $pids &&
  sleep 1
  cd /app/noto-integration-service &&
  ./gradlew clean bootRun  
  fi
fi
