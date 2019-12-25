FROM opensuse/tumbleweed

RUN zypper refresh && zypper -n update
RUN zypper -n in java-13-openjdk sudo curl wget unzip
RUN curl -o /install.sh https://rclone.org/install.sh
RUN yes | bash /install.sh
RUN rm -rf /install.sh && mkdir /app
WORKDIR /app
RUN curl -o spigot-1.15.1.jar https://cdn.getbukkit.org/spigot/spigot-1.15.1.jar
RUN mkdir /root/.minecraft && echo "eula=true" > /app/eula.txt
COPY server.properties /app/server.properties
COPY run.sh /app/run.sh
RUN mkdir -p /root/.config/rclone/
CMD ["bash", "run.sh"]
