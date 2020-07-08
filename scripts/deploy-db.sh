#!/bin/bash

set -ex

cd $WORKDIR && rake db:create && rake db:migrate