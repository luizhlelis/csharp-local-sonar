# csharp-local-sonar

This repo will be usefull to you if you want to run a [sonarqube](https://docs.sonarqube.org/latest/analysis/coverage/) ennvironment locally to see all your `dotnet` application metrics with the same features that [sonarcloud](https://sonarcloud.io) brings to you.

After `dotnet` installed, you need to install also the `dotnet-sonarscanner` tool, type the command below in the terminal:

``` bash
    dotnet tool install --global dotnet-sonarscanner
```

You will need also to install [Java Developer Kit](https://www.oracle.com/java/technologies/javase-jdk15-downloads.html).

## Prerequisites

Install [docker](https://www.docker.com/products/docker-desktop) and [dotnet](https://dotnet.microsoft.com/download) in your local host to get up sonar locally and run all dotnet's automated test.

## Run

First you need to up your docker sonarqube image with this command:

``` bash
    docker run -d --rm --name sonarqube \
    -v "$(pwd)/plugins":/opt/sonarqube/extensions/plugins/ \
    -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
    -p 9000:9000 \
    sonarqube:8.5-community
```

Then open your favorite browser and type this (as shown above, the container port was binded to the same port in the host, the 9000, if you bind to another port above change it below too):

``` bash
    http://localhost:9000
```

When sonar is fully loaded, on about page, click `Log In` and at the `Log In to SonarQube` page type default Login and Password:

- Login: `admin`
- Password: `admin`

then you need to create a new project that will be scanned by sonar, at this step you can choose the name that you want:

- Project Key: `<YOUR-PROJECT-NAME-HERE>`
- Display name: `<YOUR-PROJECT-NAME-HERE>`

Now click on Set Up. Generate a new token but first give it a name, like `crosscutting-token` and accept that. Copy the generated token! We're gonna use it as a way to login, my case it was `5bf069e22d96da382d8e41f04ef93919ba454133`, now click on Continue.


Finally, run the `scan-your-project.sh` project passing the project name as first argument and your token as the second one:

``` bash
    ./scan-your-project.sh <YOUR-PROJECT-NAME-HERE> <YOUR-USER-TOKEN-HERE>
```
