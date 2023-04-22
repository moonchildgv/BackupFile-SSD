#!/bin/bash

sudo mount /dev/sda2 /mnt/ssd/

sudo mkdir /mnt/ssd/$(date +%d-%m-%Y)-Arch

sudo rsync -avh --exclude-from='listDir.txt' /home/ /mnt/ssd/$(date +%d-%m-%Y)-Arch

sudo umount -l /mnt/ssd

