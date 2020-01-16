#!/usr/bin/env bash
echo "starting rabbit on http://localhost:15672"
echo "Username: guest"
echo "Password: guest"

docker run --rm --hostname my-rabbit --name some-rabbit -p 15672:15672 -p 5672:5672 rabbitmq:3-management