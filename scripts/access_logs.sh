#!/bin/bash

#AWSCLI ENV VARS
#   AWS_ACCESS_KEY_ID
#   AWS_SECRET_ACCESS_KEY
#   AWS_DEFAULT_REGION

date=`date '+%Y-%m-%dT%H:%M:%SZ' --date="Yesterday"`

kubectl logs -l app=web --since-time=$date > access_$date.logs

aws s3 cp access_$date.logs s3://mylogs_bucket/shortbread-prod-access-logs/
