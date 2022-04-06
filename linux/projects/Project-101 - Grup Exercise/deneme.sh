#!/bin/bash

read -p "Input your real name: " name
read -p "Input your username: " username
read -sp "Input your password: " password


if [[ username == $(tail -1 /etc/passwd && cut -d: -f1 /etc/passwd) ]]
then
	echo "username are exists, take a unique username"
	continue
	else
	echo "username are created"
fi

sudo useradd $username

echo "Hello $name"
echo "$name, your username is: $username"
echo "your password is: $password"
echo "$name, you must change your password after first login.. It is highly recommended"

