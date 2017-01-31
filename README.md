# stunt-docker

A simple alpine based docker container for the stunt MOO server. 

The volume is /database -- on the first run the container will clone the Improvise github, primarily for the database structure. Files existing on the volume will be preserved and then copied into /database afterwards (overwriting the github versions if there are conflicts.)

One environmental variable "DATABASE_NAME"

An example:

docker built -t moo .

docker run -v ~/moodb:/database -p 7777:7777 -e 'DATABASE_NAME=Improvise.db'
