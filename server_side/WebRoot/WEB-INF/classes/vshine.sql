use mysql;

create table if not exists T_USER(
userId varchar(13)  primary key,
name varchar(16) not null,
account varchar(16) not null unique,
password varchar(16) not null,
departmentId varchar(32) not null,
sex varchar(1),
rank varchar(15)   ,
telephone varchar(15) ,
power char(32) default '00000000000000000000000000000000',
status varchar(1)   ,
description varchar(64) 
)DEFAULT CHARSET=utf8;

insert into T_USER(userId,name,account,password,departmentId,power,status) values('1','超级管理员','admin','vshine','1','1111110000000000000000000000000','0');


create table if not exists T_PORTAL(
portalId varchar(13)  primary key,
name varchar(10) not null,
parkId varchar(13) not null
)DEFAULT CHARSET=utf8;
 

create table if not exists T_STRONGHOLD(
parkId varchar(13)  primary key,
name varchar(32) not null,
code varchar(64) not null,
region varchar(64),
parentId varchar(32) not null,
type varchar(1)  
)DEFAULT CHARSET=utf8;

 
  

create table if not exists T_RECORD(
	recordId varchar(13)  primary key,
	parkId varchar(13) not null ,
	parkName varchar(32) ,
    parkCode varchar(64) ,
	departmentId varchar(13) not null,
	entryImg varchar(32) ,
	exportImg varchar(32) ,
	carId varchar(16) not null,
	entry varchar(10) not null,
	entryTime varchar(20) ,
	export varchar(10) ,
	exportTime varchar(20) ,
	shouldAmt varchar(10) ,
	realAmt varchar(10),
	freeTime varchar(10),
	userId varchar(13) not null,
	name varchar(16),
	type varchar(1) default '0',
	status varchar(1)   ,
	description varchar(64) 
)DEFAULT CHARSET=utf8;
 

create table if not exists T_DEPARTMENT(
	departmentId varchar(13)  primary key,
	name varchar(16) not null,
	parentId varchar(13) not null,
	telephone varchar(15),
	fax varchar(15) ,
	zip varchar(6) ,
	address varchar(320) ,
	description varchar(64) 
)DEFAULT CHARSET=utf8;
insert into T_DEPARTMENT(departmentId,name,parentId) values('1','中国','0');


create table if not exists T_CONFIG (
sequenceId varchar(13) ,
 IKEY VARCHAR(32)  NOT NULL, 
VALUE VARCHAR(1024)  NOT NULL,
DOMAIN VARCHAR(32)  NOT NULL,
description VARCHAR(10) 
)DEFAULT CHARSET=utf8;

create table if not exists T_CASHIER(
cashierId varchar(13)  primary key,
name varchar(16) not null,
account varchar(16) not null unique,
password varchar(16) not null,
parkId varchar(32) not null,
telephone varchar(15) ,
status varchar(1)   ,
description varchar(64) 
)DEFAULT CHARSET=utf8;
 
 

create table if not exists T_FEERULE(
ruleId varchar(13)  primary key,
type varchar(2) not null,
carType varchar(16) ,
parkId varchar(13) not null,
freeTime varchar(4) ,
maxFee varchar(5) ,
firstTime varchar(4)  ,
firstPrice varchar(4) ,
spaceTime varchar(4)  ,
spacePrice varchar(4) 
)DEFAULT CHARSET=utf8;
 

create table if not exists T_VIPCAR (
vipId varchar(13)  primary key,
parkId varchar(13)  NOT NULL ,
 carCode VARCHAR(32)  NOT NULL, 
expireTime VARCHAR(32)  NOT NULL,
description VARCHAR(64) 
)DEFAULT CHARSET=utf8;