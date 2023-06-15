#!/bin/bash
docker run -d -p 5000:5000 -p 80:80 \
	-e DEV_DATABASE_URI=mysql+mysqlconnector://authbase:123456@127.0.0.1/authbase?charset=utf8 \
	--name authbase zisokal/authbase:1.1