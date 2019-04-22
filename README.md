# Individual Project - Jeremy Reynolds

This login/registration application is very simple in execution.
Since no password hashing/salting was done it is very insecure and is also susceptible to sql injection.

## Getting Started

Using Codenvy I created a new workspace with the double stack (dev-machine, db).
The project was created using a blank Maven template.

### Installing

Commands to build and run:
```
mvn -f /projects/Login1 clean install 
cp /projects/Login1/target/*.war $TOMCAT_HOME/webapps/ROOT.war 
$TOMCAT_HOME/bin/catalina.sh run 2>&1
```
Using server: http://${server.port.8080}

Commands to create MySql Database:
```
Click to the right of 'db' and select 'New Terminal' and enter the following commands:
mysql --password
password
create database softeng;
use softeng;
CREATE TABLE `USERS` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(45) NOT NULL,
	`last_name` VARCHAR(45) NOT NULL,
	`username` VARCHAR(45) NOT NULL,
	`password` VARCHAR(45) NOT NULL,
	`question` VARCHAR(45) NOT NULL,
	`answer` VARCHAR(45) NOT NULL,
	`regdate` DATE NOT NULL,
	PRIMARY KEY (`id`)
);
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With
* [Codenvy](https://codenvy.io/) - Online IDE Manager
* [Maven](https://maven.apache.org/) - Dependency Management
* [MySql](https://www.mysql.com/) - Database

## Authors

* **Jeremy Reynolds**
