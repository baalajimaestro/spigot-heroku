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
java -Xms512M -Xmx512M -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -jar server.jar