#!/bin/bash

#node1@*****ip*****
namePrincipalNode=""

#my_secret_cookie
cookie=""

#node1@******ip*****,node2@***ip******
nodes=""
port="4000"

PORT="$port" NODES="$nodes" COOKIE="$cookie" NODE_NAME="$namePrincipalNode" elixir --name $namePrincipalNode --cookie $cookie  -S mix run --no-halt