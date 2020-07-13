FROM fedora:32

COPY adoptopenjdk.repo /etc/yum.repos.d/adoptopenjdk.repo
RUN dnf update && dnf install sudo curl wget unzip adoptopenjdk-11-openj9
RUN curl -o /install.sh https://rclone.org/install.sh
RUN yes | bash /install.sh
RUN rm -rf /install.sh && mkdir /app
WORKDIR /app
RUN curl -o server.jar https://papermc.io/api/v1/paper/1.16.1/90/download
RUN mkdir /root/.minecraft && echo "eula=true" > /app/eula.txt
COPY server.properties /app/server.properties
COPY run.sh /app/run.sh
RUN chmod -R 777 /app
RUN mkdir -p /root/.config/rclone/
CMD ["bash", "run.sh"]
