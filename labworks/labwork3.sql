PRAGMA foreign_keys = ON;
 
DROP TABLE if exists routes;
DROP TABLE if exists groups;
DROP TABLE if exists contracts;
DROP TABLE if exists points;
DROP TABLE if exists hotels;
DROP TABLE if exists hotel_room_type_links;
DROP TABLE if exists room_types;
DROP TABLE if exists tourists;
DROP TABLE if exists cities;
DROP TABLE if exists countries;
DROP TABLE if exists travel;
 
create table routes(
    period_begin date,
    period_end date,
    cost integer,
    duration integer,
    name text,
    min_ourist_mount integer,
    max_tourist_amount integer);
create table groups(
    start_date date,
    route_period_begin date,
    route_name text,
    id integer  primary key autoincrement,
        foreign key (route_period_begin)
        references routes (period_begin)
        foreign key (route_name)
        references routes (name)
    );
create table contracts(
    date date,
    number integer  primary key autoincrement,
    group_id integer,
        foreign key(group_id)
        references groups(id)
    );
    
create table room_types(
    name text);
create table points(
    start_day integer,
    stay_length integer,
    route_period_begin date,
    route_name date,
    hotel_name text,
    room_type text,
        foreign key (route_period_begin)
        references routes (period_begin)
        foreign key (route_name)
        references routes (name)
        foreign key (hotel_name)
        references hotels (name)
        foreign key (room_type)
        references room_types (name) 
    );
create table hotels(
    name text,
    stars integer,
    city_name text,
        foreign key (city_name)
        references cities (name)
    );
create table hotel_room_type_links(
    name text,
    room_type text,
    hotel_name text,
    id integer primary key autoincrement,
        foreign key (hotel_name)
        references hotelss (name)
        foreign key (room_type)
        references room_types(name)
    );
create table tourists(
    full_name text,
    gender integer,
    birth_date date,
    passport_number text primary key);
create table cities(
    name text primary key,
    country_name text,
        foreign key (country_name)
        references countries (name)
    );
create table countries(
    name text primary key);
create table travel(
    contract_number text,
    tourist_passport text,
        foreign key (contract_number)
        references contracts (number)
        foreign key (tourist_passport)
        references tourists (passport_number)
    );
insert into countries values('Russia');
insert into countries values('United States');

insert into cities values('Saint-Petersburg','Russia');
insert into cities values('Moscow','Russia');
insert into cities values('New York City','United States');
insert into cities values('Los Angeles','United States');

insert into hotels values('Plaza', 4, 'New York City');
insert into hotels values('Astoria', 3,'Moscow');
insert into hotels values('Rain', 2,'Saint-Petersburg');
insert into hotels values('Nevsky Star', 5,'Saint-Petersburg');

insert into routes values('2021-06-01','2021-09-12',50000,20,'Sunny Russia',12,20);
insert into routes values('2021-01-01','2021-12-31',150000,10,'Free States',5,10);

insert into room_types values ('Single visitor');
insert into room_types values ('Bed');
insert into room_types values ('Two visitors with one bed');
insert into room_types values ('Two visitors with two beds'); 

insert into points(start_day, stay_length, route_period_begin, route_name, hotel_name, room_type) values
       (1,5,'2021-06-01','Sunny Russia','Plaza','Bed');
