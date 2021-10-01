ALTER TABLE Servicios ADD CONSTRAINT CK_Servicios_tipo
	CHECK(tipo LIKE 'D' OR 'C' OR 'I')
	
ALTER TABLE Servicios ADD CONSTRAINT CK_Servicios_presupuesto
	CHECK(presupuesto >= 0 AND presupuesto mod 500 = 0)
	
ALTER TABLE Especialidades ADD CONSTRAINT CK_Especialidades_profesional
	CHECK(profesional LIKE 'T' OR 'F')
	
ALTER TABLE Especialidades ADD CONSTANT CK_Especialidades_salario
	CHECK(salario >= 0 AND presupuesto mod 500 = 0)
	
ALTER TABLE Participa ADD CONSTRAINT CK_Participa_salario
	CHECK(salario >= 0 AND salario mod 500 = 0)
	
ALTER TABLE Participa ADD CONSTRAINT CK_Participa_tiempo
	CHECK(tiempo >= 8 AND tiempo <= 192)
	
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_precio
	CHECK(precio >= 0 AND precio mod 500 = 0 )
	
ALTER TABLE Proyectos ADD CONSTRAINT CK_Proyectos_recursos
	CHECK(recursos >= 0 AND recursos mod 500 = 0 )
	
	
SELECT MAX(especialidades.nombre)
FROM especialidades

SELECT COUNT(codigo)
FROM proyectos