#!/usr/bin/env bash

apt install -y python3.8-venv

python3 -m venv venv
source venv/bin/activate
pip install requests
