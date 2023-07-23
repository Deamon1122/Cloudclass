#### Web Server

```
id 

pwd

ls -lrta 

sudo su 

yum install httpd* -y 

ps -aux | grep httpd 

service httpd status 
service httpd start
service httpd restart

OR 

systemctl status httpd 
systemctl start httpd 
systemctl restart httpd 

ls -lrt /var/www/html 

yum install git -y 


cd /var/www/html


git clone https://github.com/kesavkummari/kesavkummari-website-code.git

ls -lrt kesavkummari-website-code/

cp -pvr kesavkummari-website-code/* .


http://publicip

```