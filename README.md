# Individual Project CPSC 4373 - Jeremy Reynolds

This login/registration application is very simple in execution.

Since no password hashing/salting was done it is very insecure and is also susceptible to sql injection.

## Getting Started

Using Codenvy I created a new workspace with the double Java-MySQL (dev-machine, db).

The project was created using a blank Maven template.

### Installing

Commands to build and run:
```
mvn -f /projects/Registration clean install 
cp /projects/Registration/target/*.war $TOMCAT_HOME/webapps/ROOT.war 
$TOMCAT_HOME/bin/catalina.sh run 2>&1
```
Using server:
```
http://${server.port.8080}
```

## Built With
* [Codenvy](https://codenvy.io/) - Online IDE Manager
* [Maven](https://maven.apache.org/) - Dependency Management
* [MySQL](https://www.mysql.com/) - Database

## Authors

* **Jeremy Reynolds**
