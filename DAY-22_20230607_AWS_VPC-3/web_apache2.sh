#!/bin/bash

sudo apt-get update 

sudo apt-get install apache2 -y 

sudo systemctl restart apache2 

echo "Welcome To Cloud Binary" > /var/www/html/index.html
