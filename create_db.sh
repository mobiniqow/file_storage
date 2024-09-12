# ساخت دیتابیس
cd ~postgres/
sudo -u postgres psql -c "CREATE DATABASE mostgres;"
sudo -u postgres psql -c "CREATE USER mostgres WITH PASSWORD 'mostgres';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE mostgres TO mostgres;"
echo "Database created"
