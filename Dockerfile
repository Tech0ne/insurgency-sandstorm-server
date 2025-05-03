FROM cm2network/steamcmd:latest

# 581330 = Insurgency: Sandstorm server
RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir ./servers/ +login anonymous +app_update "581330 validate" +quit

RUN mkdir -p /home/steam/steamcmd/servers/Insurgency/Content/Splash/
RUN mkdir -p /home/steam/steamcmd/servers/Insurgency/Config/Server/
RUN mkdir -p /home/steam/steamcmd/servers/Insurgency/Saved/Config/
RUN mkdir -p /home/steam/steamcmd/servers/Insurgency/Saved/Config/LinuxServer/

RUN echo "[/Script/ModKit.ModIOClient]" > /home/steam/steamcmd/servers/Insurgency/Saved/Config/GameUserSettings.ini
RUN echo "bHasUserAcceptedTerms=True" >> /home/steam/steamcmd/servers/Insurgency/Saved/Config/GameUserSettings.ini

USER root

RUN ln -s /home/steam/steamcmd/servers/Insurgency/Content/Splash/Splash.bmp /splash.bmp
RUN ln -s /home/steam/steamcmd/servers/Insurgency/Config/Server/Mods.txt /mods.txt
RUN ln -s /home/steam/steamcmd/servers/Insurgency/Saved/Config/LinuxServer/Game.ini /game.ini

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

USER steam

ENTRYPOINT [ "/home/steam/steamcmd/servers/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping" ]
