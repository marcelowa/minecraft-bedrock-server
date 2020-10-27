#!/usr/bin/env sh

DOWNLOAD_URL=$(curl --insecure -s https://www.minecraft.net/en-us/download/server/bedrock  | sed 's/\n//g' | sed -n -E 's/<a.+href="(.*)".+serverBedrockLinux/\1/p' | sed -n -E 's/".+//p' | sed -n -E 's/[ ]*//gp')
wget --no-check-certificate -O bedrock_server.zip $DOWNLOAD_URL
mkdir server
cd server
unzip ../bedrock_server.zip
rm ../bedrock_server.zip

if [ -f "/config/server.properties" ]; then
    echo "Found custom server.properties"
    cp /config/server.properties .
fi
if [ -f "/config/whitelist.json" ]; then
    echo "Found whitelist.json"
    cp /config/whitelist.json .
fi
if [ -f "/config/permissions.json" ]; then
    echo "Found permissions.json"
    cp /config/whitelist.json .
fi

./bedrock_server
