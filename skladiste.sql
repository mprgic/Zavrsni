 #C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\MihaelPrgic\Documents\GitHub\Zavrsni\skladiste.sql

drop database if exists skladiste;
create database skladiste;
use skladiste;

create table proizvod(
    sifra int not null primary key auto_increment,
    sifraproizvoda char(20) not null,
    naziv varchar(20) not null,
    kolicina int not null,
    cijena decimal(18,2),
    dobavljac int not null,
    djelatnik int not null
);

create table dobavljac(
    sifra int not null primary key auto_increment,
    naziv varchar(20),
    ugovor varchar(20),
    brojmob varchar(20),
    racun varchar(11)
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    oib char (11),
    email varchar (100),
    ugovor varchar(20),
    voditelj int not null,
    proizvod int not null
);

create table voditelj(
    sifra int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    oib char(11),
    email varchar(100),
    ugovor varchar(20)
);

alter table proizvod add foreign key (dobavljac) references dobavljac(sifra);
alter table proizvod add foreign key (djelatnik) references djelatnik(sifra);

alter table djelatnik add foreign key (voditelj) references voditelj(sifra);
alter table djelatnik add foreign key (proizvod) references proizvod(sifra);

select * from voditelj;
insert into voditelj(ime,prezime,oib,email,ugovor)
values ('Matej','Matković','48593568518','matejmat@gmail.com','434277465');

select * from dobavljac;
insert into dobavljac(naziv,ugovor,brojmob,racun)
values ('MMM-VUKELIĆ','365474754',0992345320,'HR2364449852996430289'),
('Mikronis','742334653',0923284750,'HR4959058322365902890'),
('Plastika Propadalo',324654678,0954353487,'HR6599986477416504506');

select * from djelatnik;
insert into djelatnik(ime,prezime,oib,email,ugovor,voditelj,proizvod)
values ('Kruno','Krunić',17264510739,'kruno24@gmail.com',45645634,1,1),
('Andrija','Tomić',78546651520,'andrijat@gmail.com',23535345,1,1),
('Matea','Matić',35009735810,'mateam22@gmail.com',42353634,1,2),
('Silvio','Matković',93368896473,'matkovic23@gmail.com',543534,1,2),
('Andrea','Matković',46590386782,'matkovic634@gmail.com',547756,1,5),
('Tomas','Hodak',82166875287,'hodak22@gmail.com',73564567,1,4);

select * from proizvod;
insert into proizvod(sifraproizvoda,naziv,kolicina,cijena,dobavljac,djelatnik)
values (4351,'Stol',25,249.99,1,1),
(5432,'Stolac',100,149.99,1,2),
(3643,'Polica',50,299.99,1,3),
(6454,'Laptop',200,1499.99,2,4),
(5754,'Playstation 4',150,2499.99,2,5),
(6131,'Kanta za smeće',70,69.99,3,6),
(6547,'Tipkovnica',35,99.99,2,3),
(7438,'Miš',35,89.99,2,2);




