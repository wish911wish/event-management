#!/bin/ash

docker-compose up -d

docker-compose run web rails db:create

docker-compose run web rails db:migrate
