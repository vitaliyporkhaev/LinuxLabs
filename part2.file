#!/bin/bash
limit=5
flag=1
i=1

if [[ -d /home/meowly/LOG ]]
then
echo "Folder LOG doesn't exist"
fi

if [[ -d /home/meowly/BACKUP ]]
then
echo "Folder BACKUP doesn't exist"
fi

usage=$(df -m LOG | awk '!/Использовано%/{print $5}' | sed 's/%//g')
echo "Current LOG usage: $usage%"

read -p "Hello! Write please, how many old files should be erchived: " n

if [[ $limit -lt $usage ]]
then
echo "LOG folder is occupied by more than $limit%, need backup..."

cd LOG
while [[ $i -le $n ]]
do

file=$(ls -lt | awk '{print $9}' | head -$(( $i + 1 )) | tail +$(( $i + 1 )) | sed -r 's/.{,5}//')

if [[ $flag -eq 1 ]]
then
tar -cf archive.tar file-$i
rm file-$i
(( i++ ))
(( flag++ ))
continue
fi

tar -rf archive.tar file-$i
rm file-$i

(( i++ ))
done
fi

tar -xf archive.tar -C /home/meowly/BACKUP

rm /home/meowly/LOG/archive.tar
echo "Archiving was successful!"
