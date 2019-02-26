# postfix-relay

postfix-relay container, which needed if we need mail server in our stack

## build

~~~~
docker login
docker-compose -f docker-compose-build.yml build
docker-compose -f docker-compose-build.yml push
~~~~

## configuration

~~~~
# edit variables, and run script to replace those in configs
vim ./add_variables.sh
bash add_variables.sh
~~~~

## run

Use docker-compose.yml to run container with mounted config ./postfix-relay/main.cf
~~~~
docker-compose up
~~~~

