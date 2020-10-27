# Minecreft Bedrock Server

## Volume
the bedrock volume supports the following files and folders:  
  
server.properties   
whitelist.json  
permissions.json  
worlds  

## Run
```shell
docker run -d \
  --name=minecraft-bedrock-server \
  -p 19132:19132/udp \
  -v ~/bedrock-data:/bedrock \
  marcelowa/minecraft-bedrock-server:latest
```

## Pull
```shell
docker pull marcelowa/minecraft-bedrock-server:latest
```

License
MIT licensed.
