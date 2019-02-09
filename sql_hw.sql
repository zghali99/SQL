SELECT city.name FROM country
    JOIN city ON city.id = country.capital
    WHERE country.name = '___';

SELECT name, population FROM city
    WHERE population = ___;


SET client = '___';

CREATE TABLE city (id integer NOT NULL, name varchar(30), countrycode character(3), district varchar(30), population integer NOT NULL);

CREATE TABLE country (
