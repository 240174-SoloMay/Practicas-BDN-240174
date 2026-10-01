/*
============================================================
ELIMINAR USUARIOS Y ROLES ANTERIORES
============================================================
*/

DROP USER IF EXISTS 'Jeysi.Lara'@'%';
DROP USER IF EXISTS 'marco.ramirez'@'%';
DROP USER IF EXISTS 'Diego.Garrido'@'%';
DROP USER IF EXISTS 'Marianna.Gayosso'@'%';
DROP USER IF EXISTS 'jhona.leal'@'%';
DROP USER IF EXISTS 'Dara'@'%';
DROP USER IF EXISTS 'Samuel'@'%';
DROP USER IF EXISTS 'Josue'@'%';


DROP ROLE IF EXISTS 'super_admin';
DROP ROLE IF EXISTS 'admin';
DROP ROLE IF EXISTS 'seller';
DROP ROLE IF EXISTS 'buyer';
DROP ROLE IF EXISTS 'support';
DROP ROLE IF EXISTS 'common';
DROP ROLE IF EXISTS 'user_not_registered';


/*
============================================================
CREACIÓN DE USUARIOS
============================================================
*/

CREATE USER 'Jeysi.Lara'@'%'
IDENTIFIED BY '240234';

CREATE USER 'marco.ramirez'@'%'
IDENTIFIED BY 'qwerty123';

CREATE USER 'Diego.Garrido'@'%'
IDENTIFIED BY '240709';

CREATE USER 'Marianna.Gayosso'@'%'
IDENTIFIED BY '240174';

CREATE USER 'jhona.leal'@'%'
IDENTIFIED BY '240603';

CREATE USER 'Dara'@'%'
IDENTIFIED BY '240765';

CREATE USER 'Samuel'@'%'
IDENTIFIED BY '240023';

CREATE USER 'Josue'@'%'
IDENTIFIED BY '240272';


/*
============================================================
VERIFICAR QUE LOS USUARIOS EXISTEN
============================================================
*/

SELECT User, Host
FROM mysql.user
WHERE User IN (
    'Jeysi.Lara',
    'marco.ramirez',
    'Diego.Garrido',
    'Marianna.Gayosso',
    'jhona.leal',
    'Dara',
    'Samuel',
    'Josue'
);


/*
============================================================
CREACIÓN DE ROLES
============================================================
*/

CREATE ROLE 'super_admin';

CREATE ROLE 'admin';

CREATE ROLE 'seller';

CREATE ROLE 'buyer';

CREATE ROLE 'support';

CREATE ROLE 'common';

CREATE ROLE 'user_not_registered';


/*
============================================================
VERIFICAR QUE LOS ROLES EXISTEN
============================================================
*/

SELECT User, Host
FROM mysql.user
WHERE User IN (
    'super_admin',
    'admin',
    'seller',
    'buyer',
    'support',
    'common',
    'user_not_registered'
);


/*
============================================================
PRIVILEGIOS DE SUPER ADMIN
============================================================
*/

GRANT ALL PRIVILEGES
ON *.*
TO 'super_admin'
WITH GRANT OPTION;


/*
============================================================
PRIVILEGIOS DE ADMIN
============================================================
*/

GRANT ALL PRIVILEGES
ON db_test_7b.*
TO 'admin';


/*
============================================================
PRIVILEGIOS DE SELLER
============================================================
*/

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test_7b.tb_products
TO 'seller';


/*
============================================================
PRIVILEGIOS DE SUPPORT
============================================================
*/

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_user
TO 'support';

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_products
TO 'support';


/*
============================================================
PRIVILEGIOS DE BUYER
============================================================
*/

GRANT SELECT
ON db_test_7b.tb_products
TO 'buyer';


/*
============================================================
PRIVILEGIOS DE COMMON
============================================================
*/

GRANT SELECT
ON db_test_7b.*
TO 'common';


/*
============================================================
ASIGNACIÓN DE ROLES A LOS USUARIOS
============================================================
*/

/*
SUPER ADMIN — MARIANNA
*/

GRANT 'super_admin'
TO 'Marianna.Gayosso'@'%';


/*
ADMIN — MARCO
*/

GRANT 'admin'
TO 'marco.ramirez'@'%';


/*
SELLER — DIEGO
*/

GRANT 'seller'
TO 'Diego.Garrido'@'%';


/*
SELLER — JEYSI
*/

GRANT 'seller'
TO 'Jeysi.Lara'@'%';


/*
SUPPORT — DARA
*/

GRANT 'support'
TO 'Dara'@'%';


/*
BUYER — JHONA
*/

GRANT 'buyer'
TO 'jhona.leal'@'%';


/*
COMMON — SAMUEL
*/

GRANT 'common'
TO 'Samuel'@'%';


/*
SUPPORT — JOSUE
*/

GRANT 'support'
TO 'Josue'@'%';


/*
============================================================
ESTABLECER ROLES PREDETERMINADOS
============================================================
*/

SET DEFAULT ROLE 'super_admin'
TO 'Marianna.Gayosso'@'%';

SET DEFAULT ROLE 'admin'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'seller'
TO 'Diego.Garrido'@'%';

SET DEFAULT ROLE 'seller'
TO 'Jeysi.Lara'@'%';

SET DEFAULT ROLE 'support'
TO 'Dara'@'%';

SET DEFAULT ROLE 'buyer'
TO 'jhona.leal'@'%';

SET DEFAULT ROLE 'common'
TO 'Samuel'@'%';

SET DEFAULT ROLE 'support'
TO 'Josue'@'%';


/*
============================================================
VERIFICACIÓN DE PRIVILEGIOS DE LOS USUARIOS
============================================================
*/

SHOW GRANTS FOR 'Marianna.Gayosso'@'%';

SHOW GRANTS FOR 'marco.ramirez'@'%';

SHOW GRANTS FOR 'Diego.Garrido'@'%';

SHOW GRANTS FOR 'Jeysi.Lara'@'%';

SHOW GRANTS FOR 'Dara'@'%';

SHOW GRANTS FOR 'jhona.leal'@'%';

SHOW GRANTS FOR 'Samuel'@'%';

SHOW GRANTS FOR 'Josue'@'%';


/*
============================================================
VERIFICACIÓN DE PRIVILEGIOS DE LOS ROLES
============================================================
*/

SHOW GRANTS FOR 'super_admin';

SHOW GRANTS FOR 'admin';

SHOW GRANTS FOR 'seller';

SHOW GRANTS FOR 'buyer';

SHOW GRANTS FOR 'support';

SHOW GRANTS FOR 'common';

SHOW GRANTS FOR 'user_not_registered';


/*
============================================================
VERIFICACIÓN DE USUARIOS Y ROLES
============================================================
*/

SELECT
    TO_USER AS usuario,
    TO_HOST AS host,
    FROM_USER AS rol,
    FROM_HOST AS rol_host
FROM mysql.role_edges
WHERE TO_USER IN (
    'Marianna.Gayosso',
    'marco.ramirez',
    'Diego.Garrido',
    'Jeysi.Lara',
    'Dara',
    'jhona.leal',
    'Samuel',
    'Josue'
)
ORDER BY TO_USER, FROM_USER;


/*
============================================================
MENSAJE DE CONFIRMACIÓN
============================================================
*/

SELECT
    'Los usuarios, roles y privilegios han sido creados correctamente'
    AS mensaje;