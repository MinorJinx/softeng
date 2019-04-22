# Individual Project - Jeremy Reynolds

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

#### Commands to create MySQL Database:

Click to the right of 'db' in the bottom Processes pane.

Select 'New Terminal' and enter the following commands:
```
mysql --password
password
create database softeng;
use softeng;
```
#### Finally create the table:
```
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

## Built With
* [Codenvy](https://codenvy.io/) - Online IDE Manager
* [Maven](https://maven.apache.org/) - Dependency Management
* [MySQL](https://www.mysql.com/) - Database

## Authors

* **Jeremy Reynolds**