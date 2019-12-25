#
# Copyright © 2019 Maestro Creativescape
#
# SPDX-License-Identifier: AGPL-3.0
#

curl -o /root/.config/rclone/rclone.conf -u baalajimaestro:$GH_PERSONAL_TOKEN https://raw.githubusercontent.com/baalajimaestro/keys/master/mega.conf

function quit()
{
  rclone sync -P /app remote: minecraft
}

trap quit SIGINT SIGTERM SIGKILL
rclone copy -P remote:minecraft /app
cd /app
java -Xms400m -Xmx400m -jar spigot-1.15.1.jar
