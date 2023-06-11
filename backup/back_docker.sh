#!/bin/bash

# 服务器上的源目录
SRC_DIR="/root/data/docker"

# 备份文件前缀
BACKUP_NAME_PREFIX="docker_backup"

# 压缩文件格式
ARCHIVE_FORMAT="tar.gz"

# 生成备份文件名
current_date=$(date +"%Y%m%d_%H%M%S")
backup_filename="${BACKUP_NAME_PREFIX}_${current_date}.${ARCHIVE_FORMAT}"

# 压缩源目录 以root用户进行备份或解压默认带 -p（保留权限） 可以看 man tar ，如果为普通用户压缩和解压使用 sudo tar 才可以默认使用 -p 参数
tar -czf "${backup_filename}" -C "${SRC_DIR}" .

# 上传到 rclone
rclone move "${backup_filename}" od:docker_backup/

# 删除三天前的备份
rclone delete --min-age 3d od:docker_backup/