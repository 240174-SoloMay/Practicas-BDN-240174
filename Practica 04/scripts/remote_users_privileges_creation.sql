
USE db_test_7b;

/*
============================================================
1. CREACION DE USUARIOS
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

CREATE USER IF NOT EXISTS 'Josue'@'%'
IDENTIFIED BY '240272';

CREATE USER IF NOT EXISTS 'app_web'@'%'
IDENTIFIED BY 'web123';

CREATE USER IF NOT EXISTS 'app_mobile'@'%'
IDENTIFIED BY 'mobile890';


/*
============================================================
2. VERIFICACION DE USUARIOS
============================================================
*/

SELECT
    User,
    Host,
    account_locked,
    password_expired
FROM mysql.user
WHERE User IN (
    'Jeysi.Lara',
    'marco.ramirez',
    'Diego.Garrido',
    'Marianna.Gayosso',
    'jhona.leal',
    'Dara',
    'Samuel',
    'Josue',
    'app_web',
    'app_mobile'
)
ORDER BY User, Host;


/*
============================================================
3. CREACION DE ROLES
============================================================
*/

CREATE ROLE IF NOT EXISTS 'super_admin'@'%';
CREATE ROLE IF NOT EXISTS 'admin'@'%';
CREATE ROLE IF NOT EXISTS 'seller'@'%';
CREATE ROLE IF NOT EXISTS 'buyer'@'%';
CREATE ROLE IF NOT EXISTS 'support'@'%';
CREATE ROLE IF NOT EXISTS 'common_user'@'%';
CREATE ROLE IF NOT EXISTS 'user_not_registered'@'%';


/*
============================================================
4. VERIFICACION DE ROLES
============================================================
*/

SELECT
    User,
    Host
FROM mysql.user
WHERE User IN (
    'super_admin',
    'admin',
    'seller',
    'buyer',
    'support',
    'common_user',
    'user_not_registered'
)
ORDER BY User, Host;


/*
============================================================
5. PRIVILEGIOS DE LOS ROLES
============================================================
*/

-- SUPER ADMIN

GRANT ALL PRIVILEGES
ON *.*
TO 'super_admin'@'%'
WITH GRANT OPTION;


-- ADMIN

GRANT ALL PRIVILEGES
ON db_test_7b.*
TO 'admin'@'%';


-- SELLER

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test_7b.tb_products
TO 'seller'@'%';

GRANT EXECUTE
ON PROCEDURE db_test_7b.sp_soft_delete_product
TO 'seller'@'%';

GRANT EXECUTE
ON PROCEDURE db_test_7b.sp_restore_product
TO 'seller'@'%';


-- SUPPORT

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_user
TO 'support'@'%';

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_products
TO 'support'@'%';

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_categories
TO 'support'@'%';

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_product_categories
TO 'support'@'%';

GRANT EXECUTE
ON PROCEDURE db_test_7b.sp_soft_delete_product
TO 'support'@'%';

GRANT EXECUTE
ON PROCEDURE db_test_7b.sp_restore_product
TO 'support'@'%';


-- BUYER

GRANT SELECT
ON db_test_7b.tb_products
TO 'buyer'@'%';

GRANT SELECT
ON db_test_7b.vw_total_products_by_category
TO 'buyer'@'%';


-- COMMON USER

GRANT SELECT
ON db_test_7b.*
TO 'common_user'@'%';

GRANT EXECUTE
ON PROCEDURE db_test_7b.sp_register_new_user
TO 'common_user'@'%';


-- USER NOT REGISTERED

GRANT SELECT
ON db_test_7b.tb_products
TO 'user_not_registered'@'%';

GRANT EXECUTE
ON PROCEDURE db_test_7b.sp_register_new_user
TO 'user_not_registered'@'%';


/*
============================================================
6. ASIGNACION DE ROLES
============================================================
*/

-- SUPER ADMIN

GRANT 'super_admin'@'%'
TO 'Marianna.Gayosso'@'%';


-- ADMIN

GRANT 'admin'@'%'
TO 'marco.ramirez'@'%';


-- SELLER

GRANT 'seller'@'%'
TO 'Diego.Garrido'@'%',
   'Jeysi.Lara'@'%';


-- BUYER

GRANT 'buyer'@'%'
TO 'jhona.leal'@'%';


-- SUPPORT

GRANT 'support'@'%'
TO 'Josue'@'%';


-- COMMON USER

GRANT 'common_user'@'%'
TO 'Dara'@'%',
   'Samuel'@'%';


-- USER NOT REGISTERED

GRANT 'user_not_registered'@'%'
TO 'app_web'@'%',
   'app_mobile'@'%';


/*
============================================================
7. ROLES PREDETERMINADOS
============================================================
*/

SET DEFAULT ROLE 'super_admin'@'%'
TO 'Marianna.Gayosso'@'%';

SET DEFAULT ROLE 'admin'@'%'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'seller'@'%'
TO 'Diego.Garrido'@'%',
   'Jeysi.Lara'@'%';

SET DEFAULT ROLE 'buyer'@'%'
TO 'jhona.leal'@'%';

SET DEFAULT ROLE 'support'@'%'
TO 'Josue'@'%';

SET DEFAULT ROLE 'common_user'@'%'
TO 'Dara'@'%',
   'Samuel'@'%';

SET DEFAULT ROLE 'user_not_registered'@'%'
TO 'app_web'@'%',
   'app_mobile'@'%';


/*
============================================================
8. VERIFICAR EL DEFINER DEL PROCEDIMIENTO
============================================================
*/

SELECT
    ROUTINE_SCHEMA,
    ROUTINE_NAME,
    DEFINER,
    SECURITY_TYPE
FROM information_schema.ROUTINES
WHERE ROUTINE_SCHEMA = 'db_test_7b'
  AND ROUTINE_NAME = 'sp_register_new_user'
  AND ROUTINE_TYPE = 'PROCEDURE';


/*
============================================================
9. VERIFICAR ASIGNACIONES DE ROLES
============================================================
*/

SELECT
    FROM_USER AS rol,
    FROM_HOST AS host_rol,
    TO_USER AS usuario,
    TO_HOST AS host_usuario,
    WITH_ADMIN_OPTION
FROM mysql.role_edges
WHERE TO_USER IN (
    'Jeysi.Lara',
    'marco.ramirez',
    'Diego.Garrido',
    'Marianna.Gayosso',
    'jhona.leal',
    'Dara',
    'Samuel',
    'Josue',
    'app_web',
    'app_mobile'
)
ORDER BY TO_USER, FROM_USER;


/*
============================================================
10. VERIFICAR ROLES PREDETERMINADOS
============================================================
*/

SELECT
    USER,
    HOST,
    DEFAULT_ROLE_USER,
    DEFAULT_ROLE_HOST
FROM mysql.default_roles
WHERE USER IN (
    'Jeysi.Lara',
    'marco.ramirez',
    'Diego.Garrido',
    'Marianna.Gayosso',
    'jhona.leal',
    'Dara',
    'Samuel',
    'Josue',
    'app_web',
    'app_mobile'
)
ORDER BY USER, HOST;


/*
============================================================
11. VERIFICAR PRIVILEGIOS DE LOS ROLES
============================================================
*/

SHOW GRANTS FOR 'super_admin'@'%';
SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'seller'@'%';
SHOW GRANTS FOR 'buyer'@'%';
SHOW GRANTS FOR 'support'@'%';
SHOW GRANTS FOR 'common_user'@'%';
SHOW GRANTS FOR 'user_not_registered'@'%';


/*
============================================================
12. VERIFICAR PRIVILEGIOS EFECTIVOS
============================================================
*/

SHOW GRANTS FOR 'Marianna.Gayosso'@'%'
USING 'super_admin'@'%';

SHOW GRANTS FOR 'marco.ramirez'@'%'
USING 'admin'@'%';

SHOW GRANTS FOR 'Diego.Garrido'@'%'
USING 'seller'@'%';

SHOW GRANTS FOR 'Jeysi.Lara'@'%'
USING 'seller'@'%';

SHOW GRANTS FOR 'jhona.leal'@'%'
USING 'buyer'@'%';

SHOW GRANTS FOR 'Josue'@'%'
USING 'support'@'%';

SHOW GRANTS FOR 'Dara'@'%'
USING 'common_user'@'%';

SHOW GRANTS FOR 'Samuel'@'%'
USING 'common_user'@'%';

SHOW GRANTS FOR 'app_web'@'%'
USING 'user_not_registered'@'%';

SHOW GRANTS FOR 'app_mobile'@'%'
USING 'user_not_registered'@'%';


/*
============================================================
13. COMPROBACION DE PRIVILEGIOS DIRECTOS
============================================================
*/

SELECT
    GRANTEE,
    TABLE_SCHEMA,
    TABLE_NAME,
    PRIVILEGE_TYPE
FROM information_schema.TABLE_PRIVILEGES
WHERE TABLE_SCHEMA = 'db_test_7b'
  AND GRANTEE IN (
      '''app_web''@''%''',
      '''app_mobile''@''%'''
  )
ORDER BY GRANTEE, TABLE_NAME, PRIVILEGE_TYPE;


/*
============================================================
14. COMPROBACION FINAL
============================================================
*/

SELECT
    (SELECT COUNT(*)
     FROM mysql.user
     WHERE User IN (
         'Jeysi.Lara',
         'marco.ramirez',
         'Diego.Garrido',
         'Marianna.Gayosso',
         'jhona.leal',
         'Dara',
         'Samuel',
         'Josue',
         'app_web',
         'app_mobile'
     )) AS cuentas_encontradas,

    (SELECT COUNT(*)
     FROM mysql.user
     WHERE User IN (
         'super_admin',
         'admin',
         'seller',
         'buyer',
         'support',
         'common_user',
         'user_not_registered'
     )) AS roles_encontrados,

    (SELECT COUNT(*)
     FROM mysql.role_edges
     WHERE TO_USER IN (
         'Jeysi.Lara',
         'marco.ramirez',
         'Diego.Garrido',
         'Marianna.Gayosso',
         'jhona.leal',
         'Dara',
         'Samuel',
         'Josue',
         'app_web',
         'app_mobile'
     )) AS asignaciones_de_roles;


SELECT
    'Verificacion final ejecutada. Revisar los resultados anteriores.'
    AS mensaje;
