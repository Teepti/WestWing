# WestWing

Robot Framework in a official python 3 and Ubuntu based docker container.

Pre-requisites:
Docker must be installed on your system with WL2 settings.
This Script is dockerized with docker version 20.10.2 with WL2 settings.

Usage:
Download or clone whole repository on your system and go to directory which contains dockerfile using command prompt.
After downloading or cloning, run below commands to create an docker image.

command to create image:-
--------docker build "path of the directory which contains docker file"

After successfully build that image then use that Id to run that container.

Command to run created image

docker run -ti "image id that is created above"

Command to copy logs to out of container"

docker cp "Container ID of that image":/file/path to Results folder" "path of the directory which contains code"

For Example in my system, it will be 

-----docker cp 01a29dceb98e:/usr/src/robotframework/Results ./pythonProject1/--------



 



