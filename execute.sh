#!/bin/bash
namePrincipalNode="node1@*****ip*****"
cookie="my_secret_cookie"
nodes="node1@******ip*****,node2@***ip******"
port="4000"

PORT="$port" NODES="$nodes" COOKIE="$cookie" NODE_NAME="$namePrincipalNode" elixir --name $namePrincipalNode --cookie $cookie  -S mix run --no-halt