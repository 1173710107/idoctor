cd ..
cd Java Maven
call mvn install
call mvn clean package
call java -jar target/skin-v0.0.1.jar
explorer "http://127.0.0.1:8081"
pause