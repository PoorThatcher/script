### Script to backup docker data

1. Download rclone and install
``` bash
wget https://downloads.rclone.org/v1.62.2/rclone-v1.62.2-linux-amd64.deb

dpkg -i rclone-v1.62.2-linux-amd64.deb
```

2. Change corn
``` bash
crontab -e

# 30 4 * * * /bin/bash /root/back_docker.sh > /dev/null 2>&1
```

3. Time zone set
``` bash 
timedatectl

timedatectl list-timezones | grep -i shang

timedatectl set-timezone Asia/Shanghai
```


