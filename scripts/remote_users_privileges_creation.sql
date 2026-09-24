/*
============================================================
CREACIÓN DE USUARIOS
============================================================
*/

CREATE USER IF NOT EXISTS 'Jeysi.Lara'@'%'
IDENTIFIED BY '240234';

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%'
IDENTIFIED BY 'qwerty123';

CREATE USER IF NOT EXISTS 'Diego.Garrido'@'%'
IDENTIFIED BY '240709';

CREATE USER IF NOT EXISTS 'Marianna.Gayosso'@'%'
IDENTIFIED BY '240174';

CREATE USER IF NOT EXISTS 'jhona.leal'@'%'
IDENTIFIED BY '240603';

CREATE USER IF NOT EXISTS 'Dara'@'%'
IDENTIFIED BY '240765';

CREATE USER IF NOT EXISTS 'Samuel'@'%'
IDENTIFIED BY '240023';


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
    'Samuel'
);


/*
============================================================
CREACIÓN DE ROLES
============================================================
*/

CREATE ROLE IF NOT EXISTS 'super_admin';

CREATE ROLE IF NOT EXISTS 'admin';

CREATE ROLE IF NOT EXISTS 'seller';

CREATE ROLE IF NOT EXISTS 'buyer';

CREATE ROLE IF NOT EXISTS 'support';

CREATE ROLE IF NOT EXISTS 'common';

CREATE ROLE IF NOT EXISTS 'user_not_registered';


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
ON db_test_7b.tb_users
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
SUPPORT — DIEGO
*/

GRANT 'support'
TO 'Diego.Garrido'@'%';


/*
SELLER — JEYSI
*/

GRANT 'seller'
TO 'Jeysi.Lara'@'%';


/*
SELLER — DARA
*/

GRANT 'seller'
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
============================================================
ESTABLECER ROLES PREDETERMINADOS
============================================================
*/

SET DEFAULT ROLE 'super_admin'
TO 'Marianna.Gayosso'@'%';

SET DEFAULT ROLE 'admin'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'support'
TO 'Diego.Garrido'@'%';

SET DEFAULT ROLE 'seller'
TO 'Jeysi.Lara'@'%';

SET DEFAULT ROLE 'seller'
TO 'Dara'@'%';

SET DEFAULT ROLE 'buyer'
TO 'jhona.leal'@'%';

SET DEFAULT ROLE 'common'
TO 'Samuel'@'%';


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
    'Samuel'
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