#!/bin/bash
service mysql start

python3 manager.py runserver --host 0.0.0.0
