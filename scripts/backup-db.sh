#!/bin/bash

#POSTGRES ENV VARS
#   PGDATABASE
#   PGHOST
#   PGUSER
#   PGPASSWORD

#AWSCLI ENV VARS
#   AWS_ACCESS_KEY_ID
#   AWS_SECRET_ACCESS_KEY
#   AWS_DEFAULT_REGION

set -ex

pg_dump -Fc shrtbred_production > db.dump

aws s3 cp db.dump s3://mybackup_bucket/shortbread-db-prod-bkp/