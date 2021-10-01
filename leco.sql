-- CICLO 1: Tablas
CREATE TABLE Proyectos(
	codigo VARCHAR(15) NOT NULL,
	ubicacionId VARCHAR(6) NOT NULL,
	servicioId VARCHAR(5) NOT NULL,
	personaId VARCHAR(8) NOT NULL,
	nombre VARCHAR(11),
	inicio DATE NOT NULL,
	fin DATE,
	precio INT NOT NULL,
	recursos INT NOT NULL
);
CREATE TABLE Participa(
	empleadoId VARCHAR(8) NOT NULL,
	proyectoId VARCHAR(15) NOT NULL,
	salario INT NOT NULL,
	tiempo INT NOT NULL
);
CREATE TABLE Condiciones(
	id VARCHAR(15) NOT NULL,
	proyectoId VARCHAR(15) NOT NULL,
	nivelRuido INT NOT NULL,
	tipoProteccion VARCHAR(15) NOT NULL
);



CREATE TABLE Servicios(
	codigo VARCHAR(5) NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	tipo CHAR(1) NOT NULL,
	presupuesto INT NOT NULL
);
CREATE TABLE ServiciosEspecialidades(
	servicioId VARCHAR(5) NOT NULL,
	nombreEspecialidad VARCHAR(10) NOT NULL
);



CREATE TABLE Especialidades(
	nombre VARCHAR(10) NOT NULL,
	empleadoId VARCHAR(8) NOT NULL,
	profesional CHAR(1) NOT NULL,
	salario INT NOT NULL
);



CREATE TABLE Personas(
	codigo VARCHAR(8) NOT NULL,
	vinculacion DATE NOT NULL
);
CREATE TABLE Juridicas(
	codigo VARCHAR(8) NOT NULL,
	nit INT,
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
DROP TABLE Proyectos CASCADE CONSTRAINTS;
DROP TABLE Participa CASCADE CONSTRAINTS;
DROP TABLE Condiciones CASCADE CONSTRAINTS;

DROP TABLE Servicios CASCADE CONSTRAINTS;
DROP TABLE ServiciosEspecialidades CASCADE CONSTRAINTS;

DROP TABLE Especialidades CASCADE CONSTRAINTS;

DROP TABLE Personas CASCADE CONSTRAINTS;
DROP TABLE Juridicas CASCADE CONSTRAINTS;
DROP TABLE Empleados CASCADE CONSTRAINTS;

DROP TABLE Ubicaciones CASCADE CONSTRAINTS;

--CICLO1: PoblarOK(1)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2','30-09-2021','31-10-2021',2000,50000);
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('12345','D36','34TT','100457','CARLOS-2','23-09-2021','25-10-2021',10000,100000);
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('123456','D37','34TC','100458','JUAN-2','3-09-2021',NULL,80000,100000);

INSERT INTO Especialidades(nombre,empleadoId,profesional,salario) VALUES ('JULIAN-3','3452','F',3000000);
INSERT INTO Especialidades(nombre,empleadoId,profesional,salario) VALUES ('DANIEL-3','3453','T',4000000);
INSERT INTO Especialidades(nombre,empleadoId,profesional,salario) VALUES ('JUANA-3','3454','T',2000000);

INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4455','21-08-2019');
INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4456','15-08-2019');
INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4457','10-08-2019');

INSERT INTO Ubicaciones(codigo,municipio,departamento) VALUES ('5678','Tunja','Boyaca');
INSERT INTO Ubicaciones(codigo,municipio,departamento) VALUES ('5679','Bogota','Cund');
INSERT INTO Ubicaciones(codigo,municipio,departamento) VALUES ('5670','Neiva','Huila');

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','D',30000000);
INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67346','CONSTRUCCION','C',60000000);
INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67347','INTERVENTORIA','I',90000000);
--CICLO1: PoblarNoOK(2)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2',30092021,'31-10-2021',2000,50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES (NULL,'D36','34TT','100457','CARLOS-2','23-09-2021','25-10-2021',10000,100000);

INSERT INTO PERSONAS(codigo,vinculacion) VALUES ('4455','2019-08-21');

INSERT INTO Juridicas(codigo,nit,razonSocial) VALUES ('123456789',123487,'razonSocial');

--CICLO1: PoblarNoOK(3)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO','30-09-2021','31-10-2021',2000,50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2','30-09-2021','31-10-2021',2000,-50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('12345','D36','34TT','100457','CARLOS-2','27-09-2021','25-10-2021',10000,100000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','H',30000000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','INTERVENTORIA','I',45390876);
--CICLO 1: XPoblar(Eliminar los datos)
DELETE FROM Proyectos;
DELETE FROM Participa;
DELETE FROM Condiciones;

DELETE FROM Servicios;
DELETE FROM ServiciosEspecialidades;

DELETE FROM Especialidades;

DELETE FROM Personas;
DELETE FROM Juridicas;
DELETE FROM Empleados;

DELETE FROM Ubicaciones;
--CICLO 1: Atributos
ALTER TABLE Servicios ADD CONSTRAINT CK_Servicios_tipo
	CHECK(tipo LIKE 'D' OR tipo LIKE 'C' OR tipo LIKE 'I');
	
ALTER TABLE Servicios ADD CONSTRAINT CK_Servicios_presupuesto
	CHECK(presupuesto >= 0 AND MOD(presupuesto,500) = 0);
	
ALTER TABLE Especialidades ADD CONSTRAINT CK_Especialidades_profesional
	CHECK(profesional LIKE 'T' OR profesional LIKE 'F');
	
ALTER TABLE Especialidades ADD CONSTRAINT CK_Especialidades_salario
	CHECK(salario >= 0 AND MOD(salario,500) = 0);
	
ALTER TABLE Participa ADD CONSTRAINT CK_Participa_salario
	CHECK(salario >= 0 AND MOD(salario,500) = 0);
	
ALTER TABLE Participa ADD CONSTRAINT CK_Participa_tiempo
	CHECK(tiempo >= 8 AND tiempo <= 192);
	
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_precio
	CHECK(precio >= 0 AND MOD(precio,500) = 0 );
	
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_recursos
	CHECK(recursos >= 0 AND MOD(recursos,500) = 0 );
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_nombre
	CHECK(recursos LIKE '%-%');
--CICLO1: Primarias
ALTER TABLE Proyectos ADD CONSTRAINT PK_Proyectos
	PRIMARY KEY (codigo);
ALTER TABLE Participa ADD CONSTRAINT PK_Participa
	PRIMARY KEY (empleadoId, proyectoId);
	
ALTER TABLE Servicios ADD CONSTRAINT PK_Servicios
	PRIMARY KEY (codigo);
ALTER TABLE ServiciosEspecialidades ADD CONSTRAINT PK_ServiciosEspecialidades
	PRIMARY KEY (servicioId, nombreEspecialidad);
	
ALTER TABLE Especialidades ADD CONSTRAINT PK_Especialidades
	PRIMARY KEY (nombre);
	
ALTER TABLE Personas ADD CONSTRAINT PK_Personas
	PRIMARY KEY (codigo);
ALTER TABLE Juridicas ADD CONSTRAINT PK_Juridicas
	PRIMARY KEY (codigo);
ALTER TABLE Empleados ADD CONSTRAINT PK_Empleados
	PRIMARY KEY (codigo);
	

ALTER TABLE Ubicaciones ADD CONSTRAINT PK_Ubicaciones
	PRIMARY KEY (codigo);
	
--CICLO1: UNICAS
ALTER TABLE Proyectos ADD CONSTRAINT UK_Proyectos
	UNIQUE (nombre);
ALTER TABLE Juridicas ADD CONSTRAINT UK_Juridicas
	UNIQUE(nit);
--CICLO1: FORANEAS
ALTER TABLE Proyectos ADD CONSTRAINT FK_Proyectos_Ubicaciones
	FOREIGN KEY (ubicacionId) REFERENCES Ubicaciones(codigo);
ALTER TABLE Proyectos ADD CONSTRAINT FK_Proyectos_Servicios
	FOREIGN KEY (servicioId) REFERENCES Servicios(codigo);
ALTER TABLE Proyectos ADD CONSTRAINT FK_Proyectos_Personas
	FOREIGN KEY (personaId) REFERENCES Personas(codigo);
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_Empleados
	FOREIGN KEY (empleadoId) REFERENCES Empleados(codigo);
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_Proyectos
	FOREIGN KEY (proyectoId) REFERENCES Proyectos(codigo);
	
ALTER TABLE ServiciosEspecialidades ADD CONSTRAINT FK_SE_Especialidades
	FOREIGN KEY (servicioId) REFERENCES Especialidades(nombre);
ALTER TABLE ServiciosEspecialidades ADD CONSTRAINT FK_ServiciosE_Especialidades
	FOREIGN KEY (nombreEspecialidad) REFERENCES Servicios(codigo);
	
ALTER TABLE Juridicas ADD CONSTRAINT FK_Juridicas_Personas
	FOREIGN KEY (codigo) REFERENCES Personas(codigo);
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados_Especialidades
	FOREIGN KEY (especialidad) REFERENCES Especialidades(nombre);
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados_Ubicaciones
	FOREIGN KEY (vivienda) REFERENCES Ubicaciones(codigo);
--CICLO 1: PoblarNoOK (2)
INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO','30-09-2021','31-10-2021',2000,50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('1234','D35','34TY','100456','ALBERTO-2','30-09-2021','31-10-2021',2000,-50000);

INSERT INTO Proyectos(codigo,ubicacionId,servicioId,personaId,nombre,inicio,fin,precio,recursos) VALUES ('12345','D36','34TT','100457','CARLOS-2','27-09-2021','25-10-2021',10000,100000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','DISEÑO','H',30000000);

INSERT INTO Servicios(codigo,nombre,tipo,presupuesto) VALUES ('67345','INTERVENTORIA','I',45390876);
--CICLO1:Consultar las especialidades más requeridas en el año actual
SELECT MAX(especialidades.nombre)
FROM especialidades
--CICLO1:Cuantos proyectos diferentes hay en total
SELECT COUNT(codigo)
FROM proyectos