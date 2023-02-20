#!/bin/bash
limit=10

#                  remove extra lines               replacing multiple % with one
usage=$(df /LOG | awk '!/Использовано/{print $5}' | sed 's/%//g' )
echo "Current LOG usage: $usage%"
if [ $limit -lt $usage ] #n1 -lt n2 <=> n1<n2 
then
echo "LOG folder is occupied by more than $limit%, need backup..."
tar cfvz archive.tar.gz /LOG #pack the archive from LOG 
tar xfvz archive.tar.gz -C /BACKUP #unzip the archive to BACKUP
rm /LOG/* #remove files from LOG
echo "Backup is done"
fi

