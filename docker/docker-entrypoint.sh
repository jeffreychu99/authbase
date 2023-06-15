#!/bin/bash
service mysql start

cd ui
npm run dev&
cd ..

#python3 manager.py runserver --host 0.0.0.0
python3 -m flask --app start run -h 0.0.0.0
