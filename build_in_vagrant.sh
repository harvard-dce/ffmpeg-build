#!/bin/bash

sudo aptitude update
sudo aptitude install -y git htop
cd /vagrant

./build.sh
