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


