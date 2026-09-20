/* CREACIÓN DE USUARIOS */

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'Mayte.Gayosso'@'%' IDENTIFIED BY '240174';
CREATE USER IF NOT EXISTS 'Jeysi.Lara'@'%' IDENTIFIED BY '240234';
CREATE USER IF NOT EXISTS 'Diego_Garrido'@'%' IDENTIFIED BY '240080';

/* SUPER USUARIO -- SOLO PARA NOMBRE.APELLIDO */

GRANT ALL PRIVILEGES
ON *.*
TO 'Mayte.Gayosso'@'%';

/* PRIVILEGIOS DIRECTOS DE DIEGO */

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test_7b.*
TO 'Diego_Garrido'@'%';

/* CREACIÓN DE ROLES */

CREATE ROLE IF NOT EXISTS 'super_admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support'; 
CREATE ROLE IF NOT EXISTS 'common';
CREATE ROLE IF NOT EXISTS 'user_not_registered';

/* PRIVILEGIOS DE SUPER ADMIN */

GRANT ALL PRIVILEGES
ON db_test_7b.*
TO 'super_admin';

/* PRIVILEGIOS DE SELLER */

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test_7b.tb_products
TO 'seller';

/* PRIVILEGIOS DE SUPPORT */

GRANT SELECT, UPDATE, INSERT
ON db_test_7b.tb_users, db_test_7b.tb_products
TO 'support';

/* PRIVILEGIOS DE BUYER */

GRANT SELECT
ON db_test_7b.tb_products
TO 'buyer';

/* PRIVILEGIOS DE COMMON */

GRANT SELECT
ON db_test_7b.tb_products
TO 'common';

/* ASIGNACIÓN DE ROLES */

GRANT 'super_admin'
TO 'Mayte.Gayosso'@'%';

GRANT 'support'
TO 'Diego_Garrido'@'%';

/* ROLES POR DEFECTO */

SET DEFAULT ROLE 'super_admin'
TO 'Mayte.Gayosso'@'%';

SET DEFAULT ROLE 'support'
TO 'Diego_Garrido'@'%';

/* ACTUALIZAR PRIVILEGIOS */

FLUSH PRIVILEGES;

/* COMPROBAR PRIVILEGIOS */

SHOW GRANTS FOR 'Mayte.Gayosso'@'%';
SHOW GRANTS FOR 'Diego_Garrido'@'%';