#!/bin/bash
# LookingGlass startup command for Docker
export PID_FILE=/var/run/elasticsearch.pid
export ES_HOME=/usr/share/elasticsearch
export CONF_FILE=/etc/elasticsearch/elasticsearch.yml
export LOG_DIR=/var/log/elasticsearch
export DATA_DIR=/var/lib/elasticsearch
export CONF_DIR=/etc/elasticsearch
export WORK_DIR=/tmp/elasticsearch
/usr/share/elasticsearch/bin/elasticsearch -d -p $PID_FILE \
  --default.config=$CONF_FILE --default.path.home=$ES_HOME \
  --default.path.logs=$LOG_DIR --default.path.data=$DATA_DIR \
  --default.path.work=$WORK_DIR --default.path.conf=$CONF_DIR

source /etc/profile.d/rvm.sh
cd /var/www/LookingGlass
bundle exec puma -d

nginx -g 'daemon off;'
