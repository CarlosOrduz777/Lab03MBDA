-- CICLO 1: Tablas
CREATE TABLE Proyectos(
	codigo VARCHAR(15) NOT NULL,
	ubicacionId VARCHAR(6) NOT NULL,
	servicioId VARCHAR(5) NOT NULL,
	personaId VARCHAR(8) NOT NULL,
	nombre VARCHAR(11),
	inicio DATE NOT NULL,
	fin DATE,
	recursos INTEGER(9) NOT NULL
);
CREATE TABLE Participa(
	empleadoId VARCHAR(8) NOT NULL,
	proyectoId VARCHAR(15) NOT NULL,
	salario INTEGER(9) NOT NULL,
	tiempo INTEGER(3) NOT NULL
);



CREATE TABLE Servicios(
	codigo VARCHAR(5) NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	tipo CHAR(1) NOT NULL,
	presupuesto INTEGER(9) NOT NULL
);
CREATE TABLE ServiciosEspecialidades(
	servicioId VARCHAR(5) NOT NULL,
	nombreEspecialidad VARCHAR(10) NOT NULL
);



CREATE TABLE Especialidades(
	nombre VARCHAR(10) NOT NULL,
	empleadoId VARCHAR(8) NOT NULL,
	profesional BOOLEAN NOT NULL,
	salario INTEGER(9) NOT NULL
);



CREATE TABLE Personas(
	codigo VARCHAR(8) NOT NULL,
	vinculacion DATE NOT NULL
);
CREATE TABLE Juridicas(
	codigo VARCHAR(8) NOT NULL,
	nit INTEGER(11),
	razonSocial VARCHAR(20) NOT NULL
);
CREATE TABLE Empleados(
	codigo VARCHAR(8) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	proyectos VARCHAR(3) NOT NULL,
	especialidad VARCHAR(10) NOT NULL,
	vivienda VARCHAR(6) NOT NULL
);



CREATE TABLE Ubicaciones(
	codigo VARCHAR(6) NOT NULL,
	municipio VARCHAR(15) NOT NULL,
	departamento VARCHAR(10) NOT NULL
);

--CICLO1: XTablas
DROP TABLE Proyectos;
DROP TABLE Participa;

DROP TABLE Servicios;
DROP TABLE ServiciosEspecialidades;

DROP TABLE Especialidades;

DROP TABLE Personas;
DROP TABLE Juridicas;
DROP TABLE Empleados;

DROP TABLE Ubicaciones;

--CICLO1: PoblarOK(1)
