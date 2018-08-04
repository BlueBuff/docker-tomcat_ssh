
## TOMCAT DOCKERFILE BUILD FILE

1. download jdk to current dir && download apache-tomcat to current dir
2. execute commond " docker build -t <image-name>:<tag-name> <dockerfile-path> "
3. docker run -d -P <image-name>:<tag-name>
4. tomcat log ==> docker logs -f <container-id> || docker logs -f <container-name>
5. ssh ==> ssh -t user@ip -p <port> "ssh -t root@127.0.0.1 -p 32775"

##  thanks you! bye .
