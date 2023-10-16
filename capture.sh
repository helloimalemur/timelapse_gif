#!/bin/bash

mkdir /tmp/capture
raspistill -o /tmp/capture/$(date +%m-%d-%Y_%H-%M).jpg
cp /tmp/capture/* /root/timelapse
rm -rf /tmp/capture/
