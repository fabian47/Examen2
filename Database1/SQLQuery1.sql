CREATE DATABASE TuBaseDeDatos;
USE TuBaseDeDatos;

CREATE TABLE Equipos (
  equipo_id INT IDENTITY(1,1) PRIMARY KEY,
  usuario_id INT NOT NULL,
  nombre_equipo VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE Usuarios (
  usuario_id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tecnicos (
  tecnico_id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  especialidad VARCHAR(255) NOT NULL
);

CREATE TABLE Reparaciones (
  reparacion_id INT IDENTITY(1,1) PRIMARY KEY,
  equipo_id INT NOT NULL,
  tecnico_id INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_final DATE,
  estado VARCHAR(255) NOT NULL
);

CREATE TABLE Asignaciones (
  asignacion_id INT IDENTITY(1,1) PRIMARY KEY,
  reparacion_id INT NOT NULL,
  tecnico_id INT NOT NULL,
  fecha_asignacion DATE NOT NULL
);

CREATE TABLE DetallesReparacion (
  detalles_reparacion_id INT IDENTITY(1,1) PRIMARY KEY,
  reparacion_id INT NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  costo DECIMAL(10,2) NOT NULL
);

ALTER TABLE Equipos
ADD CONSTRAINT fk_equipos_usuarios
FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id);

ALTER TABLE Reparaciones
ADD CONSTRAINT fk_reparaciones_equipos
FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id);

ALTER TABLE Reparaciones
ADD CONSTRAINT fk_reparaciones_tecnicos
FOREIGN KEY (tecnico_id) REFERENCES Tecnicos(tecnico_id);

ALTER TABLE Asignaciones
ADD CONSTRAINT fk_asignaciones_reparaciones
FOREIGN KEY (reparacion_id) REFERENCES Reparaciones(reparacion_id);

ALTER TABLE Asignaciones
ADD CONSTRAINT fk_asignaciones_tecnicos
FOREIGN KEY (tecnico_id) REFERENCES Tecnicos(tecnico_id);

ALTER TABLE DetallesReparacion
ADD CONSTRAINT fk_detalles_reparacion
FOREIGN KEY (reparacion_id) REFERENCES Reparaciones(reparacion_id);