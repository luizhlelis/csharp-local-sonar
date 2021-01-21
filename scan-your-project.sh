#!/bin/bash
SONAR_PROJECT_NAME=$1
SONAR_USER_TOKEN=$2
if [ -z SONAR_PROJECT_NAME ] ; then
    echo "Please, pass the sonar project name as first argument"
else 
    if [ -z SONAR_USER_TOKEN ] ; then
        echo "Please, pass your sonarqube user account token as second argument"
    else
        echo "$SONAR_PROJECT_NAME"
        echo "$SONAR_USER_TOKEN"
        dotnet sonarscanner begin /k:"$SONAR_PROJECT_NAME" \
            /d:sonar.host.url="http://localhost:9000" \
            /d:sonar.login="$SONAR_USER_TOKEN" \
            /d:sonar.cs.opencover.reportsPaths="**/*/coverage.opencover.xml"
        dotnet build
        dotnet test --settings runsettings.xml
        dotnet sonarscanner end /d:sonar.login="$SONAR_USER_TOKEN"
    fi
fi