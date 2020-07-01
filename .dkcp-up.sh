#!/bin/bash

echo "This script starts three containers:"
echo "  - 1 apache httpd server"
echo "  - 2 tomcat servers\n"

THIS_OS="`uname -s`"
echo "You are running on ${THIS_OS} machine."

# if [ ${THIS_OS}!="Darwin" ]; then
#     cd "$(dirname "$0")"
#     # Request root privilege
#     [ "$UID" -eq 0 ] || exec sudo "$0" "$@"
# fi

# Check Installed Components
IS_DOCKER="`docker -v`"
IS_DKCP="`docker-compose -v`"

if [ ${IS_DOCKER:0:6} == "Docker" ]; then
    echo "Docker ----------- ok"
else
    echo "docker is not installed, install docker first plz"
    exit 1
fi

if [ ${IS_DKCP:0:15} == "docker-compose" ]; then
    echo "Docker-compose --- ok"
else
    echo "docker-compose is not installed, install docker-compose first plz"
    exit 1
fi

# copy web source files into tomcat
cp -r ./webp/ ./src/tomcat_src/webapps/webp/

cd src
docker-compose up -d --build
