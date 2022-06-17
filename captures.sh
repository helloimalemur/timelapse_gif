#!/bin/bash

mkdir /tmp/capture
raspistill -o /tmp/capture/$(date +%m-%d-%Y_%H-%M).jpg
cp /tmp/capture/* /home/pi/timelapse
rm -rf /tmp/capture/
