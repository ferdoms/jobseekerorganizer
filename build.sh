#!/bin/bash

src=$(pwd)

# ENVs
export REACT_APP_ACCOUNT_API=localhost:80
export REACT_APP_JOBAPPLICATION_API=localhost:80

function build {
    echo "Setting up jsofrontend environment."
    echo

    echo " - Building building dependencies:"

    # Account microservice
    cd "$src/jso-account-ms"
    mvn package -DskipTests > /dev/null
    echo "jso-account-ms: OK"

    # JobApplication microservice
    cd "$src/jso-jobapplication-ms"
    mvn package -DskipTests > /dev/null
    echo "jso-jobapplication-ms: OK"
    echo    

    echo " - Building docker-compose:"
    (docker-compose build) > /dev/null
    echo "   OK"
    echo 

    echo " - Starting containers:"
    docker-compose up

}

build  
