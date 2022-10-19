drop table if exists Store cascade;
drop table if exists Product cascade;
drop table if exists Userr cascade;
drop table if exists Customer cascade;
drop table if exists Manager cascade;
drop table if exists Warehouse cascade;

create table Store(
	storeid int not null,
	name char(30) not null,
	latitude decimal(8,6) not null,
	longitude decimal(9,6) not null,
	dateestablished date,
	manages int not null,
	foreign key (manages) references Manager(userid),
	primary key (storeid)
);

create table Product(
	productname char(30) not null,
	numberofunits int not null,
	priceperunits int not null,
	description char(100),
	imageurl char(30),
	storeid int not null,
	has int not null,
	foreign key (has) references Store(storeid),
	primary key (productname, has)
	on delete cascade
);

create table Userr(
	userid int not null,
	password char(11) not null,
	name char(50) not null,
	email char(50),
	primary key (userid)
);

create table Customer(
	creditscore int,
	latitude decimal(8,6) not null,
	longitude decimal(9,6) not null,
	userid int not null,
	foreign key (userid) references Userr(userid),
	primary key (userid)
);

create table Manager(
	degree char(20),
	salary int not null,
	userid int not null,
	foreign key (userid) references Userr(userid),
	primary key (userid)
);

create table Warehouse(
	warehouseid int not null,
	area int,
	latitude decimal(8,6) not null,
	longitude decimal(9,6) not null,
	primary key (warehouseid)
);

create table Supplies(
	productname char(30) not null,
	warehouseid int not null,
	foreign key (productname) references Product(productname),
	foreign key (warehouseid) references Warehouse(warehouseid),
	primary key (productname, warehouseid)
);

create table Updatee(
	productname char(30),
	manager int,
	foreign key (productname) references Product(productname),
	foreign key (manager) references Manager(userid),
	primary key (productname, manager)
);


create table Requests(
	unitsrequested int,
	manager int,
	CHANGETHIS not null,
	foreign key (manager) references Manager(userid),
	foreign key (CHANGETHIS) references CHNGETHIS,
	primary key (manager, CHANGETHIS)
);

create table Orders(
	unitsordered int not null,
	orderdate date not null,
	productname char(30) not null,
	customer int not null,
	foreign key (productname) references Product(productname),
	foreign key (customer) references Customer(userid),
	primary key (customer, product, orderdate)
);