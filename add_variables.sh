# if you have example.com domain - then REMOTE_HOST="example.com"
REMOTE_HOST="my_domain.com"

sed -i -e "s@{{ REMOTE_HOST }}@$REMOTE_HOST@g" ./main.cf

