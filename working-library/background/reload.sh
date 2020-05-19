echo ""> uWSGI.log
conda activate py36
pkill -f uwsgi -9
nginx -s stop
redis-cli -h 127.0.0.1 -p 6379 shutdown
redis-server &
nginx
uwsgi --ini uwsgi.ini
python manage.py runserver 0:8080
