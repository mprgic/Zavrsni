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
    roktrajanja datetime,
    djelatnik int not null,
    dobavljac int not null
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
    voditelj int not null
);

create table voditelj(
    sifra int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    oib char(11),
    email varchar(100),
    ugovor varchar(20)
);


alter table proizvod add foreign key (djelatnik) references djelatnik(sifra);
alter table proizvod add foreign key (dobavljac) references dobavljac(sifra);

alter table djelatnik add foreign key (voditelj) references voditelj(sifra);
