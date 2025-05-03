#!/bin/sh

API_KEY=$(cat /api_key || echo "")
echo "AccessToken=$API_KEY" >> /home/steam/steamcmd/servers/Insurgency/Saved/Config/GameUserSettings.ini

/home/steam/steamcmd/servers/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping "$@"
