#!/usr/bin/env sh

DOWNLOAD_URL=$(curl --insecure -s https://www.minecraft.net/en-us/download/server/bedrock  | sed 's/\n//g' | sed -n -E 's/<a.+href="(.*)".+serverBedrockLinux/\1/p' | sed -n -E 's/".+//p' | sed -n -E 's/[ ]*//gp')
wget --no-check-certificate -O bedrock_server.zip $DOWNLOAD_URL
mkdir server
cd server
unzip ../bedrock_server.zip
rm ../bedrock_server.zip

if [ ! -f "/bedrock/server.properties" ]; then
    cp server.properties /bedrock/.
fi

if [ ! -f "/bedrock/whitelist.json" ]; then
    echo "[]" > /bedrock/whitelist.json
fi

if [ ! -f "/bedrock/permissions.json" ]; then
    echo "[]" > /bedrock/permissions.json
fi

if [ ! -d "/bedrock/worlds" ]; then
  mkdir -p /bedrock/worlds  
fi

rm -rf worlds
rm -f server.properties
rm -f whitelist.json
rm -f permissions.json

ln -s /bedrock/worlds .
ln -s /bedrock/server.properties .
ln -s /bedrock/whitelist.json .
ln -s /bedrock/permissions.json .

./bedrock_server
