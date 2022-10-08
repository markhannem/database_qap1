-- CITIES
INSERT into airports_qap1.city values (1, 'St.Johns' ,'NL' ,150000);
update airports_qap1.city set "city_Pop" = 114000
INSERT into airports_qap1.city values (2, 'Deer Lake' ,'NL' ,5300);
INSERT into airports_qap1.city values (3, 'Gander' ,'NL' ,12000);
INSERT into airports_qap1.city values (4, 'Halifax' ,'NS' ,417000);
INSERT into airports_qap1.city values (5, 'Moncton' ,'NB' ,86000);
INSERT into airports_qap1.city values (6, 'Toronto' ,'ON' ,3000000);
INSERT into airports_qap1.city values (7, 'Thompson' ,'AB' ,13000);
INSERT into airports_qap1.city values (8, 'Regina' ,'SK' ,230000);
INSERT into airports_qap1.city values (9, 'Sachs Harbour' ,'NT' ,103);
INSERT into airports_qap1.city values (10, 'Old Crow' ,'YT' ,221);

SELECT * FROM airports_qap1.city;

-- AIRCRAFT
INSERT into airports_qap1.aircraft values (1, 'Boeing 747', 'Air Canada', 300);
INSERT into airports_qap1.aircraft values (2, 'A220', 'Westjet', 125);
INSERT into airports_qap1.aircraft values (3, 'Learjet', 'Porter', 70);
INSERT into airports_qap1.aircraft values (4, 'Beech', 'Pal Airlines', 15);

SELECT * FROM airports_qap1.aircraft;

--AIRPORTS
INSERT into airports_qap1.airport values (1,'St.Johns International', 'YYT')
INSERT into airports_qap1.airport values (2,'Deer Lake Regional', 'YDF')
INSERT into airports_qap1.airport values (3,'Gander International', 'YQX')
INSERT into airports_qap1.airport values (4,'Halifax Stanfield International', 'YHZ')
INSERT into airports_qap1.airport values (5,'Romeo LeBlanc International', 'YQM')
INSERT into airports_qap1.airport values (6,'McEwen', 'CCG4')
INSERT into airports_qap1.airport values (7,'Lester B. Pearson', 'YYZ')
INSERT into airports_qap1.airport values (8,'Billy Bishop', 'YTZ')
INSERT into airports_qap1.airport values (9,'Thompson Municipal', 'YTH')
INSERT into airports_qap1.airport values (10,'Regina International', 'YQR')
INSERT into airports_qap1.airport values (11,'Sachs Harbour', 'YSY')
INSERT into airports_qap1.airport values (12,'Old Crow', 'YOC')

SELECT * FROM airports_qap1.airport ORDER BY id ASC;

--Passengers
INSERT into airports_qap1.passenger values (1, 'Billy', 'Bob', 7095351234);
update airports_qap1.passenger set "phone_Number" = 7095351234;
INSERT into airports_qap1.passenger values (2, 'Barry', 'Allen', 7095355722);
INSERT into airports_qap1.passenger values (3, 'Bruce', 'Wayne', 7095353583);
INSERT into airports_qap1.passenger values (4, 'Diana', 'Prince', 7097352577);
INSERT into airports_qap1.passenger values (5, 'Steve', 'Rogers', 7095351234);
INSERT into airports_qap1.passenger values (6, 'Natasha', 'Romanova', 7096260015);
INSERT into airports_qap1.passenger values (7, 'Tony', 'Stark', 7097352577);
INSERT into airports_qap1.passenger values (8, 'Ororo', 'Munroe', 7096268836);
INSERT into airports_qap1.passenger values (9, 'Bruce', 'Banner', 7096260015);
INSERT into airports_qap1.passenger values (10, 'Darcy', 'Walker', 7099627532);
INSERT into airports_qap1.passenger values (11, 'Clark', 'Kent', 7097762600);

SELECT * FROM airports_qap1.passenger ORDER BY id ASC;

-- One to Many Relationship: Airports to City
update airports_qap1.airport set city_id = 1 where id in (1);
update airports_qap1.airport set city_id = 2 where id in (2);
update airports_qap1.airport set city_id = 3 where id in (3);
update airports_qap1.airport set city_id = 4 where id in (4);
update airports_qap1.airport set city_id = 5 where id in (5, 6);
update airports_qap1.airport set city_id = 6 where id in (7, 8);
update airports_qap1.airport set city_id = 7 where id in (9);
update airports_qap1.airport set city_id = 8 where id in (10);
update airports_qap1.airport set city_id = 9 where id in (11);
update airports_qap1.airport set city_id = 10 where id in (12);


SELECT * FROM airports_qap1.airport ORDER BY id ASC;

-- Q1: What airports are in what cities?
SELECT airport."airport_Name", city."city_Name"
FROM airports_qap1.airport, airports_qap1.city
WHERE city.id = airport.city_id
ORDER BY city."city_Name" ASC;
---------------------------------------------------


INSERT INTO airports_qap1.passenger_aircraft VALUES (1,1);
INSERT INTO airports_qap1.passenger_aircraft VALUES (1,3);
INSERT INTO airports_qap1.passenger_aircraft VALUES (1,4);
INSERT INTO airports_qap1.passenger_aircraft VALUES (2,1);
INSERT INTO airports_qap1.passenger_aircraft VALUES (2,2);
INSERT INTO airports_qap1.passenger_aircraft VALUES (3,1);
INSERT INTO airports_qap1.passenger_aircraft VALUES (3,4);
INSERT INTO airports_qap1.passenger_aircraft VALUES (4,2);
INSERT INTO airports_qap1.passenger_aircraft VALUES (5,3);
INSERT INTO airports_qap1.passenger_aircraft VALUES (5,4);
INSERT INTO airports_qap1.passenger_aircraft VALUES (6,1);
INSERT INTO airports_qap1.passenger_aircraft VALUES (7,2);
INSERT INTO airports_qap1.passenger_aircraft VALUES (8,1);
INSERT INTO airports_qap1.passenger_aircraft VALUES (8,2);
INSERT INTO airports_qap1.passenger_aircraft VALUES (9,1);
INSERT INTO airports_qap1.passenger_aircraft VALUES (9,3);
INSERT INTO airports_qap1.passenger_aircraft VALUES (9,4);
INSERT INTO airports_qap1.passenger_aircraft VALUES (10,2);
INSERT INTO airports_qap1.passenger_aircraft VALUES (10,4);
INSERT INTO airports_qap1.passenger_aircraft VALUES (11,3);
INSERT INTO airports_qap1.passenger_aircraft VALUES (11,4);

SELECT * FROM airports_qap1.passenger_aircraft;

-- Q2: List all aircraft passengers have travelled on?
SELECT passenger."first_Name", passenger."last_name", aircraft."type"
FROM airports_qap1.passenger, airports_qap1.aircraft, airports_qap1.passenger_aircraft
WHERE passenger.id = passenger_aircraft.passenger_id and aircraft.id = passenger_aircraft.aircraft_id
order by passenger.id;
-------------------------------------------------------------------------------------------------------
SELECT * FROM airports_qap1.airport_aircraft;
-- 1. St.Johns to
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 1, 1, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 1, 1, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 1, 1, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 1, 1, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 1, 1, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 1, 1, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 2, 1, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (1, 3, 1, 9);


-- 2. Deer Lake to
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 4, 2, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 2, 2, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (2, 3, 2, 9);

-- 3. Gander to
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 4, 3, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 4, 3, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 4, 3, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 1, 3, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 1, 3, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 1, 3, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 1, 3, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 2, 3, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (3, 3, 3, 9);

-- 4. Halifax to
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 1, 4, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 4, 4, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 1, 4, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 1, 4, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 2, 4, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (4, 3, 4, 9);

-- 5. Romeo(Moncton) to
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 1, 5, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 4, 5, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 1, 5, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 4, 5, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 1, 5, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 1, 5, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 4, 5, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 2, 5, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (5, 3, 5, 10);


-- 6. McEwen(Moncton) to
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 1, 6, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 2, 6, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (6, 3, 6, 8);


-- 7. Lester B Pearson(Toronto) to
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 1, 7, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 1, 7, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 1, 7, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 2, 7, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (7, 3, 7, 10);

-- 8. Billy Bishop(Toronto) to
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 1);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 3);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 1, 8, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 2, 8, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (8, 3, 8, 10);

-- 9. Thompson to
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 2);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 4);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 4, 9, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 4, 9, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 1, 9, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 1, 9, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 2, 9, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 3, 9, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 4, 9, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (9, 4, 9, 11);

-- 10. Regina to
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 2, 10, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 3, 10, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 4, 10, 5);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 2, 10, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 3, 10, 6);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 1, 10, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 2, 10, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 3, 10, 7);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 2, 10, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 3, 10, 8);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 2, 10, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 3, 10, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 4, 10, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 4, 10, 11);
INSERT INTO airports_qap1.airport_aircraft VALUES (10, 4, 10, 12);

-- 11. Sachs Harbour to
INSERT INTO airports_qap1.airport_aircraft VALUES (11, 4, 11, 9);
INSERT INTO airports_qap1.airport_aircraft VALUES (11, 4, 11, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (11, 4, 11, 12);


-- 12. Old Crow to
INSERT INTO airports_qap1.airport_aircraft VALUES (12, 4, 12, 10);
INSERT INTO airports_qap1.airport_aircraft VALUES (12, 4, 12, 11);

SELECT * FROM airports_qap1.airport_aircraft;

-------------------------------------------------------------------------------------------------------

INSERT into airports_qap1.arrivals values (1,'St.Johns International')
INSERT into airports_qap1.arrivals values (2,'Deer Lake Regional')
INSERT into airports_qap1.arrivals values (3,'Gander International')
INSERT into airports_qap1.arrivals values (4,'Halifax Stanfield International')
INSERT into airports_qap1.arrivals values (5,'Romeo LeBlanc International')
INSERT into airports_qap1.arrivals values (6,'McEwen')
INSERT into airports_qap1.arrivals values (7,'Lester B. Pearson')
INSERT into airports_qap1.arrivals values (8,'Billy Bishop')
INSERT into airports_qap1.arrivals values (9,'Thompson Municipal')
INSERT into airports_qap1.arrivals values (10,'Regina International')
INSERT into airports_qap1.arrivals values (11,'Sachs Harbour')
INSERT into airports_qap1.arrivals values (12,'Old Crow')

SELECT * FROM airports_qap1.arrivals;

INSERT into airports_qap1.departures values (1,'St.Johns International');
INSERT into airports_qap1.departures values (2,'Deer Lake Regional');
INSERT into airports_qap1.departures values (3,'Gander International');
INSERT into airports_qap1.departures values (4,'Halifax Stanfield International');
INSERT into airports_qap1.departures values (5,'Romeo LeBlanc International');
INSERT into airports_qap1.departures values (6,'McEwen');
INSERT into airports_qap1.departures values (7,'Lester B. Pearson');
INSERT into airports_qap1.departures values (8,'Billy Bishop');
INSERT into airports_qap1.departures values (9,'Thompson Municipal');
INSERT into airports_qap1.departures values (10,'Regina International');
INSERT into airports_qap1.departures values (11,'Sachs Harbour');
INSERT into airports_qap1.departures values (12,'Old Crow');

SELECT * FROM airports_qap1.departures;

-- Q3: Which airports can aircraft depart and arrive?
SELECT aircraft."type", departures."depart_name", arrivals."arrival_name"
FROM airports_qap1.airport, airports_qap1.aircraft, airports_qap1.airport_aircraft, airports_qap1.departures, 
airports_qap1.arrivals
WHERE airport.id = airport_aircraft.airport_name and aircraft.id = airport_aircraft.aircraft_type
and departures.id = airport_aircraft.depart and arrivals.id = airport_aircraft.arrive
ORDER BY airport.id;
---------------------------------------------------------------------------------------------------------------

insert into airports_qap1.airports_passengers values (1, 1);
insert into airports_qap1.airports_passengers values (1, 2);
insert into airports_qap1.airports_passengers values (1, 3);
insert into airports_qap1.airports_passengers values (1, 4);

insert into airports_qap1.airports_passengers values (2, 1);
insert into airports_qap1.airports_passengers values (2, 4);
insert into airports_qap1.airports_passengers values (2, 5);

insert into airports_qap1.airports_passengers values (3, 1);
insert into airports_qap1.airports_passengers values (3, 7);
insert into airports_qap1.airports_passengers values (3, 10);
insert into airports_qap1.airports_passengers values (3, 11);

insert into airports_qap1.airports_passengers values (4, 3);
insert into airports_qap1.airports_passengers values (4, 4);

insert into airports_qap1.airports_passengers values (5, 1);
insert into airports_qap1.airports_passengers values (5, 4);
insert into airports_qap1.airports_passengers values (5, 5);
insert into airports_qap1.airports_passengers values (5, 8);
insert into airports_qap1.airports_passengers values (5, 9);

insert into airports_qap1.airports_passengers values (6, 2);
insert into airports_qap1.airports_passengers values (6, 6);
insert into airports_qap1.airports_passengers values (6, 7);

insert into airports_qap1.airports_passengers values (7, 3);
insert into airports_qap1.airports_passengers values (7, 5);
insert into airports_qap1.airports_passengers values (7, 7);
insert into airports_qap1.airports_passengers values (7, 9);

insert into airports_qap1.airports_passengers values (8, 9);
insert into airports_qap1.airports_passengers values (8, 10);

insert into airports_qap1.airports_passengers values (9, 10);
insert into airports_qap1.airports_passengers values (9, 11);
insert into airports_qap1.airports_passengers values (9, 12);

insert into airports_qap1.airports_passengers values (10, 1);
insert into airports_qap1.airports_passengers values (10, 2);
insert into airports_qap1.airports_passengers values (10, 6);
insert into airports_qap1.airports_passengers values (10, 10);

insert into airports_qap1.airports_passengers values (11, 1);
insert into airports_qap1.airports_passengers values (11, 2);
insert into airports_qap1.airports_passengers values (11, 3);

SELECT * FROM airports_qap1.airports_passengers;

-- Q4: What airports have passengers used?

select passenger."first_Name", passenger."last_name", airport."airport_Name"
FROM airports_qap1.passenger, airports_qap1.airport, airports_qap1.airports_passengers
where passenger.id = airports_passengers.passenger_id and airport.id = airports_passengers.airport_id
order by passenger.id;

---------------------------------------------------------------------------------------------------------------
--END
