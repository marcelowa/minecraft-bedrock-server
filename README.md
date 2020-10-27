# Minecreft Bedrock Server

## Run
```shell
docker run -d --name=minecraft-bedrock-server \
    -e API_KEY=your_api_key_on_cloudflare \
    -e EMAIL=youremail@example.com \
    -e ZONE=example.com \
    -e HOST=foo.example.com \
    marcelowa/minecraft-bedrock-server:latest
```

## Pull
```shell
docker pull marcelowa/minecraft-bedrock-server:latest
```

License
MIT licensed.
