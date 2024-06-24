# Sistema SSE
Permite conectar ciento de usuarios en a un pub/sub usando SSE en lugar de websockets. Además de permitir crear un cluster de nodos en diferentes vps. 


### Example .env

```
NODE_NAME="node1@IP_DE_TU_PRIMERA_VPS"
COOKIE="my_secret_cookie"
NODES="node1@IP_DE_TU_PRIMERA_VPS,node2@IP_DE_TU_Segundo_VPS"
PORT=4000
```


  # Command run
`   elixir --name node1@******IP***PORT*** --cookie my_secret_cookie -S mix run --no-halt`


# Suscribirse a un SSE
`curl -N http://*****IP**PORT***/sse`
# Mandar un mensaje
`curl -X POST http://******IP****PORT**/send_message -d "topic=default" -d "message=Hola"`