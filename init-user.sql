use mysql;
CREATE USER 'authbase'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON *.* TO 'authbase'@'localhost';
flush privileges;