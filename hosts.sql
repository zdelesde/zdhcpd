CREATE TABLE hosts (
	interface VARCHAR (32),
	pool VARCHAR (32),
	ip VARCHAR (16) PRIMARY KEY NOT NULL,
	hostname VARCHAR (255) NOT NULL,
	mac VARCHAR (32) UNIQUE,
	expire DATETIME,
	client VARCHAR (255),
	count INTEGER NOT NULL,
	ping integer,
	UNIQUE(interface, mac)
);

CREATE TABLE cnames (
	cname VARCHAR (255) PRIMARY KEY NOT NULL,
	hostname VARCHAR (255) NOT NULL
);

CREATE TABLE mxrecords (
	mx VARCHAR (255) PRIMARY KEY NOT NULL,
	priority INTEGER NOT NULL,
	hostname VARCHAR (255) NOT NULL
);

CREATE VIEW dns as
	select hostname as qname,
	'A' as qtype
	from hosts
UNION
	select cname as qname,
	'CNAME' as qtype
	from cnames
UNION
	select mx as qname,
	'MX' as qtype
	from mxrecords;
