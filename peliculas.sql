-- Crear base de datos llamada películas 
CREATE DATABASE peliculas
\c peliculas

-- Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas.
CREATE TABLE peliculas(
id SMALLINT,
pelicula VARCHAR(100),
ano_estreno SMALLINT,
director VARCHAR(100),
PRIMARY KEY (id));

CREATE TABLE repartos(
id_reparto SMALLINT,
actor VARCHAR(100),
FOREIGN KEY (id_reparto) REFERENCES peliculas (id));

-- Cargar ambos archivos a su tabla correspondiente
\copy peliculas FROM 'peliculas.csv' csv header;
\copy repartos FROM 'reparto.csv' csv;

-- Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto. 
SELECT pelicula, ano_estreno, director, actor FROM peliculas INNER JOIN repartos ON id=id_reparto AND pelicula='Titanic';

-- Listar los titulos de las películas donde actúe Harrison Ford
SELECT pelicula FROM peliculas INNER JOIN repartos ON id=id_reparto AND actor='Harrison Ford';

-- Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100
SELECT director, COUNT(id<=100) FROM peliculas GROUP BY director LIMIT 10;

-- Indicar cuantos actores distintos hay
SELECT COUNT(x) FROM (
    SELECT COUNT(actor)
    FROM repartos 
    GROUP BY actor) as x;
    

