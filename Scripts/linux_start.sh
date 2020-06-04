#!/bin/bash
cd ..
cd "Java Maven"
mvn install
mvn clean package
java -jar target/skin-v0.0.1.jar
explorer "http://127.0.0.1:8081"
pause