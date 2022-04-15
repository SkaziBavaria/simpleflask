-- sudo mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';
-- USE mysql;
-- UPDATE user SET plugin='mysql_native_password' WHERE User='root';
CREATE DATABASE IF NOT EXISTS flaskapp;
-- GRANT ALL PRIVILEGES ON flaskapp.* TO 'root'@'%' IDENTIFIED BY 'root';
-- GRANT ALL PRIVILEGES ON flaskapp.* TO 'root'@'localhost' IDENTIFIED BY 'root';
--USE flaskapp;
--CREATE TABLE IF NOT EXISTS users (name varchar(20), email varchar(40));
-- FLUSH PRIVILEGES;
