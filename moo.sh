#!/bin/bash
[ -z "$DATABASE_NAME" ] && DATABASE_NAME=Improvise.db
if [ -f "/database/.init" ];
then
   echo "Starting MOO."
else
   if [ -f "/database" ];
   then
      cp -r /database /tmp/db
   else
      mkdir /tmp/db
   fi
   git clone https://github.com/toddsundsted/improvise /database
   mkdir /database/backup
   touch /database/.init
   cp -r /tmp/db /database
fi
cd /database
if [ -f "/database/${DATABASE_NAME}.new" ];
   gzip "${DATABASE_NAME}"
   mv "${DATABASE_NAME}.new" "${DATABASE_NAME}"
fi   
/src/stunt/moo "${DATABASE_NAME}" "${DATABASE_NAME}.new" 7777
