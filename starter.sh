#!/bin/bash
# make directory 
sudo mkdir -p "/var/html/www/storage_linloa/static/" 
sudo chmod -R 777 "/var/html/www/storage_linloa/static/"
sudo mkdir -p "/var/log/storage_linloa" 
sudo touch  "/var/log/storage_linloa/access.log"  
echo "static directory created"

sudo mkdir -p "/var/html/www/storage_linloa/media/"
sudo chmod -R 777 "/var/html/www/storage_linloa/media/"
echo "media directory created"

sudo mkdir -p "/var/html/www/storage_linloa/template/"
sudo chmod -R 777 "/var/html/www/storage_linloa/template/"

echo "template directory created"

# create database
sudo chmod +X create_db.sh
sh ./create_db.sh
cd /home/ubuntu/storage_linloa

# deploy database
sudo  cp ./storage_linloa.config  /etc/nginx/sites-available/storage_linloa 
sudo ln -sf /etc/nginx/sites-available/storage_linloa  /etc/nginx/sites-enabled/storage_linloa 
sudo  cp ./storage_linloa.service  /etc/systemd/system/storage_linloa.service
echo "template directory created"
sudo  cp ./storage_linloa.socket  /etc/systemd/system/storage_linloa.socket
echo "template directory created"
sudo systemctl daemon-reload

python -m pip install pip

pip install -q -r req.txt

sudo nginx -t

sudo systemctl restart nginx
echo "sudo systemctl restart"
sudo systemctl restart storage_linloa.socket
sudo systemctl restart storage_linloa.service

sudo systemctl enable  storage_linloa.socket 
sudo systemctl restart storage_linloa.service

black .

python manage.py makemigrations --settings core.settings.prod
python manage.py migrate --settings core.settings.prod
python manage.py collectstatic --no-input --settings core.settings.prod

sudo certbot --nginx -d linloa.net -d www.linloa.net
sudo systemctl restart nginx
echo "done"
