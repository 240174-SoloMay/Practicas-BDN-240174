CREATE USER 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER 'nombre.apellido'@'%' IDENTIFIED BY 'sumatricula';
CREATE USER 'Jeysi.Lara'@'%' IDENTIFIED BY '240234';
CREATE USER 'Jhonatan.Gonzalez'@'%' IDENTIFIED BY '240080';

/* Asignar los privilegios de super usuario IMPORTANTE: SOLO USTEDES!! */
GRANT ALL PRIVILEGIES ON *.* TO 'nombre.apellido'@'%';

/* ASIGNAR PRIVILEGIOS DE SELECCION,INSERCIÓN,ACTUALIZACIÓN Y ELIMINACIÓN AL USUARIO DE IZQUIERDA */
GRANT SELECT, UPDATE, INSERT, DELETE ON db_test_7b.* TO 'Jhonatan.Gonzalez'@'%';

/* CREACIÓN DE ROLES PARA EL SISTEMA DE ECOMERCE */
CREATE ROLE 'admin';
CREATE ROLE 'seller';
CREATE ROLE 'buyer';
CREATE ROLE 'support';
CREATE ROLE 'common';
CREATE ROLE 'user_not_registered';


/* ASIGNAR PRIVILEGIOS A LOS ROLES CREADOS */
-- Admin
GRANT ALL PRIVILEGES ON db_test_7b.* TO 'admin';
-- Support
GRANT SELECT, UPDATE, INSERT ON db_test_7b.* TO 'support';


/* ASIGNAR ROLES A LOS USUARIOS CREADOS */
GRANT 'admin' TO 'Mayte.Gutiérrez'@'%';

GRANT 'support' TO 'Jhonatan.Gonzalez'@'%';





