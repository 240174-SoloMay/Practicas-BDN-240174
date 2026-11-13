# Diccionario de Datos — db_test_7b

**Proyecto:** Practicas-BDN-240174  
**Motor / versión:** MySQL 8.0.46  
**Respaldo de referencia:** `respaldo_111126_1794591103484.sql`  
**SHA-256:** `335554beff65d9117b70947d65cda5a562b575b31c8420f77ac79d1fb8466b12`  
**Charset / collation:** `utf8mb4` / `utf8mb4_0900_ai_ci`

## Alcance y verificación

Se contrastaron nombres y orden de columnas, claves primarias y foráneas, índices y cantidades por tabla contra el respaldo SQL. No se ejecutó el SQL ni se consultó una base de datos. Los conteos corresponden a filas incluidas en el respaldo, no a una consulta en vivo. Las 25 tablas tienen una sección de datos en el archivo; cuando no hay sentencias `INSERT`, el conteo es 0. El respaldo no declara `COMMENT` para tablas ni columnas. Las descripciones incluidas son editoriales y se redactaron a partir de los nombres, tipos y relaciones; no son comentarios oficiales ni reglas de negocio confirmadas.

**Resumen:** 25 tablas · 190 columnas · 33 relaciones FK · 97,472 filas incluidas en el respaldo.

## Índice

- [tb_carts](#tb_carts) — 0 registros
- [tb_categories](#tb_categories) — 100 registros
- [tb_logs](#tb_logs) — 49,745 registros
- [tb_order_cancellations](#tb_order_cancellations) — 0 registros
- [tb_orders](#tb_orders) — 0 registros
- [tb_payment_methods](#tb_payment_methods) — 0 registros
- [tb_payment_transaction](#tb_payment_transaction) — 0 registros
- [tb_payments](#tb_payments) — 0 registros
- [tb_people](#tb_people) — 7,503 registros
- [tb_product_categories](#tb_product_categories) — 17,572 registros
- [tb_products](#tb_products) — 15,024 registros
- [tb_products_users_providers](#tb_products_users_providers) — 0 registros
- [tb_refunds](#tb_refunds) — 0 registros
- [tb_returns](#tb_returns) — 0 registros
- [tb_shipments](#tb_shipments) — 0 registros
- [tb_user](#tb_user) — 7,528 registros
- [tb_user_addresses](#tb_user_addresses) — 0 registros
- [tbc_payment_methods_types](#tbc_payment_methods_types) — 0 registros
- [tbd_address_components](#tbd_address_components) — 0 registros
- [tbd_cancellation_items](#tbd_cancellation_items) — 0 registros
- [tbd_cart_items](#tbd_cart_items) — 0 registros
- [tbd_order_items](#tbd_order_items) — 0 registros
- [tbd_return_items](#tbd_return_items) — 0 registros
- [tbd_user_payment_methods](#tbd_user_payment_methods) — 0 registros
- [tbd_users_wishlist_products](#tbd_users_wishlist_products) — 0 registros

## Conteo de filas por tabla

El siguiente conteo corresponde a filas incluidas en el respaldo SQL; no es una consulta en vivo.

| Tabla | Registros incluidos en el respaldo |
|---|---:|
| [tb_carts](#tb_carts) | 0 filas |
| [tb_categories](#tb_categories) | 100 filas |
| [tb_logs](#tb_logs) | 49,745 filas |
| [tb_order_cancellations](#tb_order_cancellations) | 0 filas |
| [tb_orders](#tb_orders) | 0 filas |
| [tb_payment_methods](#tb_payment_methods) | 0 filas |
| [tb_payment_transaction](#tb_payment_transaction) | 0 filas |
| [tb_payments](#tb_payments) | 0 filas |
| [tb_people](#tb_people) | 7,503 filas |
| [tb_product_categories](#tb_product_categories) | 17,572 filas |
| [tb_products](#tb_products) | 15,024 filas |
| [tb_products_users_providers](#tb_products_users_providers) | 0 filas |
| [tb_refunds](#tb_refunds) | 0 filas |
| [tb_returns](#tb_returns) | 0 filas |
| [tb_shipments](#tb_shipments) | 0 filas |
| [tb_user](#tb_user) | 7,528 filas |
| [tb_user_addresses](#tb_user_addresses) | 0 filas |
| [tbc_payment_methods_types](#tbc_payment_methods_types) | 0 filas |
| [tbd_address_components](#tbd_address_components) | 0 filas |
| [tbd_cancellation_items](#tbd_cancellation_items) | 0 filas |
| [tbd_cart_items](#tbd_cart_items) | 0 filas |
| [tbd_order_items](#tbd_order_items) | 0 filas |
| [tbd_return_items](#tbd_return_items) | 0 filas |
| [tbd_user_payment_methods](#tbd_user_payment_methods) | 0 filas |
| [tbd_users_wishlist_products](#tbd_users_wishlist_products) | 0 filas |

## Tablas y columnas

“— (no declarado)” en DEFAULT significa que el respaldo no especifica un valor predeterminado. PK indica clave primaria; FK incluye restricción y columna referenciada.

### tb_carts

- **Descripción:** Cabecera de los carritos de compra asociados a usuarios, con su estado y fechas de creación y actualización.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de cabecera de los carritos de compra asociados a usuarios, con su estado y fechas de creación y actualización. |
| user_ID | int | No | — (no declarado) | — | tb_carts_ibfk_1 → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** uk_cart_user: (user_ID) UNIQUE

**Claves foráneas:** tb_carts_ibfk_1: (user_ID) → tb_user(ID)
### tb_categories

- **Descripción:** Catálogo de categorías de productos. La relación consigo misma permite representar categorías superiores y subcategorías.
- **Registros en el respaldo:** 100
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de catálogo de categorías de productos. la relación consigo misma permite representar categorías superiores y subcategorías. |
| name | varchar(120) | No | — (no declarado) | — | — | — | — | Nombre legible de la entidad o elemento del catálogo. |
| description | text | Sí | — (no declarado) | — | — | — | — | Texto descriptivo asociado a la entidad; su contenido lo proporciona la aplicación. |
| sup_id_category | int unsigned | Sí | NULL | — | fk_superior_category → tb_categories.ID | — | — | Identificador que referencia tb_categories.ID y vincula este registro con la entidad relacionada. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | No | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** name: (name) UNIQUE; fk_superior_category: (sup_id_category)

**Claves foráneas:** fk_superior_category: (sup_id_category) → tb_categories(ID)
### tb_logs

- **Descripción:** Bitácora de operaciones registradas sobre tablas y filas, con usuario, tipo de operación, fecha, descripción y estado.
- **Registros en el respaldo:** 49,745
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=54859 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int | No | — (no declarado) | Sí | — | Sí | — | Identificador único de bitácora de operaciones registradas sobre tablas y filas, con usuario, tipo de operación, fecha, descripción y estado. |
| table_name | varchar(80) | No | — (no declarado) | — | — | — | — | Nombre de la tabla sobre la que se registró la operación. |
| record_id | int unsigned | Sí | NULL | — | — | — | — | Identificador de la fila afectada; el esquema no declara una clave foránea para este campo. |
| table_operation | enum('Create','Read','Update','Delete') | Sí | NULL | — | — | — | — | Tipo de operación registrada; el respaldo define Create, Read, Update y Delete. |
| db_user | varchar(288) | No | — (no declarado) | — | — | — | — | Nombre o identificador del usuario de base de datos registrado como actor de la operación. |
| operation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora en que se registró la operación. |
| operation_description | text | No | — (no declarado) | — | — | — | — | Texto con el detalle de la operación registrada. |
| operation_status | bit(1) | Sí | b'1' | — | — | — | — | Indicador binario del estado de la operación; el respaldo no documenta el significado de cada valor. |

**Índices:** idx_logs_table_op: (table_name, table_operation); idx_logs_tabla_registro: (table_name, record_id)

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_order_cancellations

- **Descripción:** Solicitudes de cancelación vinculadas a una orden y al usuario que las solicita, con motivo y estado.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de solicitudes de cancelación vinculadas a una orden y al usuario que las solicita, con motivo y estado. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_order_cancellations_order → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| requested_by | int | No | — (no declarado) | — | fk_order_cancellations_user → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| reason | text | No | — (no declarado) | — | — | — | — | Motivo proporcionado para la solicitud o el evento asociado al registro. |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_order_cancellations_order: (order_ID); fk_order_cancellations_user: (requested_by)

**Claves foráneas:** fk_order_cancellations_order: (order_ID) → tb_orders(ID); fk_order_cancellations_user: (requested_by) → tb_user(ID)
### tb_orders

- **Descripción:** Cabecera de órdenes de compra con vendedor, importes, estado de preparación y fechas.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de cabecera de órdenes de compra con vendedor, importes, estado de preparación y fechas. |
| seller_ID | int | No | — (no declarado) | — | tb_orders_ibfk_1 → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| subtotal | decimal(12,2) | No | '0.00' | — | — | — | — | Importe subtotal asociado a la orden o renglón, expresado en la moneda que gestione la aplicación. |
| shipping_cost | decimal(12,2) | No | '0.00' | — | — | — | — | Importe del costo de envío de la orden. |
| fulfillment_status | enum('Pending','Accepted','Preparing','Sent','Delivered','Canceled','Returned') | No | 'Pending' | — | — | — | — | Estado del proceso de preparación y entrega de la orden; los valores permitidos están definidos por el ENUM. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** seller_ID: (seller_ID)

**Claves foráneas:** tb_orders_ibfk_1: (seller_ID) → tb_user(ID)
### tb_payment_methods

- **Descripción:** Catálogo de métodos de pago, con nombre, descripción y estado.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de catálogo de métodos de pago, con nombre, descripción y estado. |
| name | varchar(100) | No | — (no declarado) | — | — | — | — | Nombre legible de la entidad o elemento del catálogo. |
| description | text | Sí | — (no declarado) | — | — | — | — | Texto descriptivo asociado a la entidad; su contenido lo proporciona la aplicación. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** Sin índices secundarios declarados.

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_payment_transaction

- **Descripción:** Datos de transacciones de pasarela asociadas a un pago, incluida la referencia externa y respuesta recibida.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de datos de transacciones de pasarela asociadas a un pago, incluida la referencia externa y respuesta recibida. |
| payment_ID | int unsigned | No | — (no declarado) | — | fk_trans_payment → tb_payments.ID | — | — | Identificador que referencia tb_payments.ID y vincula este registro con la entidad relacionada. |
| transaction_reference | varchar(255) | No | — (no declarado) | — | — | — | — | Referencia de la transacción recibida o usada por el procesador de pagos. |
| gateway_response | text | Sí | — (no declarado) | — | — | — | — | Respuesta de texto recibida de la pasarela de pago, si se registra. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_trans_payment: (payment_ID)

**Claves foráneas:** fk_trans_payment: (payment_ID) → tb_payments(ID)
### tb_payments

- **Descripción:** Pagos asociados a órdenes, con importe, método de pago del usuario y estado del pago.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de pagos asociados a órdenes, con importe, método de pago del usuario y estado del pago. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_payments_order → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| user_payment_method_ID | bigint unsigned | Sí | NULL | — | fk_payments_user_method → tbd_user_payment_methods.ID | — | — | Identificador que referencia tbd_user_payment_methods.ID y vincula este registro con la entidad relacionada. |
| amount | decimal(12,2) | No | — (no declarado) | — | — | — | — | Importe del pago o reembolso, según la tabla donde aparece. |
| payment_status | enum('Pending','Approved','Rejected','Refunded') | No | 'Pending' | — | — | — | — | Estado del pago; las opciones permitidas están definidas por el ENUM. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_payments_order: (order_ID); fk_payments_user_method: (user_payment_method_ID)

**Claves foráneas:** fk_payments_order: (order_ID) → tb_orders(ID); fk_payments_user_method: (user_payment_method_ID) → tbd_user_payment_methods(ID)
### tb_people

- **Descripción:** Datos personales y de contacto asociados opcionalmente a una cuenta de usuario.
- **Registros en el respaldo:** 7,503
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=7504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** person_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| person_ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de datos personales y de contacto asociados opcionalmente a una cuenta de usuario. |
| user_ID | int | Sí | NULL | — | fk_people_users → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| courtesy_title | varchar(20) | Sí | NULL | — | — | — | — | Tratamiento o título de cortesía de la persona, si se proporciona. |
| given_names | varchar(150) | No | — (no declarado) | — | — | — | — | Nombre o nombres de pila de la persona. |
| family_names | varchar(150) | Sí | NULL | — | — | — | — | Apellidos de la persona, si se proporcionan. |
| birth_date | date | Sí | NULL | — | — | — | — | Fecha de nacimiento de la persona, si se proporciona. |
| gender | enum('Hombre','Mujer','Prefiero no decirlo') | No | 'Prefiero no decirlo' | — | — | — | — | Valor de género seleccionado; las opciones permitidas se definen en el ENUM. |
| country_code | char(2) | Sí | NULL | — | — | — | — | Código de país de dos caracteres asociado a los datos de contacto. |
| phone | varchar(25) | Sí | NULL | — | — | — | — | Número telefónico de contacto, si se proporciona. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | Sí | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** user_ID: (user_ID) UNIQUE

**Claves foráneas:** fk_people_users: (user_ID) → tb_user(ID)
### tb_product_categories

- **Descripción:** Tabla de asociación entre productos y categorías; cada fila vincula un producto con una categoría.
- **Registros en el respaldo:** 17,572
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** product_Id, category_Id

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| product_Id | int unsigned | No | — (no declarado) | Sí | fk_pc_product → tb_products.ID | — | — | Identificador que referencia tb_products.ID y vincula este registro con la entidad relacionada. |
| category_Id | int unsigned | No | — (no declarado) | Sí | fk_pc_category → tb_categories.ID | — | — | Identificador que referencia tb_categories.ID y vincula este registro con la entidad relacionada. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | No | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** idx_pc_category: (category_Id)

**Claves foráneas:** fk_pc_category: (category_Id) → tb_categories(ID); fk_pc_product: (product_Id) → tb_products(ID)
### tb_products

- **Descripción:** Catálogo de productos con SKU, nombre, descripción, precio, existencias y estado.
- **Registros en el respaldo:** 15,024
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=24626 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de catálogo de productos con sku, nombre, descripción, precio, existencias y estado. |
| SKU | varchar(50) | No | — (no declarado) | — | — | — | — | Código SKU del producto utilizado para identificarlo en el catálogo. |
| name | varchar(250) | No | — (no declarado) | — | — | — | — | Nombre legible de la entidad o elemento del catálogo. |
| description | text | Sí | — (no declarado) | — | — | — | — | Texto descriptivo asociado a la entidad; su contenido lo proporciona la aplicación. |
| current_price | decimal(10,2) | No | '0.00' | — | — | — | — | Precio actual registrado para el producto. |
| current_stock | int unsigned | No | '0' | — | — | — | — | Cantidad de existencias actuales registradas para el producto. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | No | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** SKU: (SKU) UNIQUE

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_products_users_providers

- **Descripción:** Asociación entre usuarios y productos para registrar el tipo de participación del usuario como proveedor.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** user_ID, product_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| user_ID | int | No | — (no declarado) | Sí | fk_products_users_providers_user → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| product_ID | int unsigned | No | — (no declarado) | Sí | fk_products_users_providers_product → tb_products.ID | — | — | Identificador que referencia tb_products.ID y vincula este registro con la entidad relacionada. |
| type_ownership | enum('Owner','Reseller','Distributor') | Sí | NULL | — | — | — | — | Tipo de participación del usuario respecto al producto; las opciones se definen en el ENUM. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| available_date | datetime | No | — (no declarado) | — | — | — | — | Fecha y hora desde la que se registra la disponibilidad de la asociación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora asociadas al último cambio o evento indicado por la aplicación; el esquema no precisa cuál. |

**Índices:** idx_products_users_providers_product: (product_ID)

**Claves foráneas:** fk_products_users_providers_product: (product_ID) → tb_products(ID); fk_products_users_providers_user: (user_ID) → tb_user(ID)
### tb_refunds

- **Descripción:** Devoluciones de importes vinculadas a pagos, con cantidad reembolsada, motivo y fechas.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de devoluciones de importes vinculadas a pagos, con cantidad reembolsada, motivo y fechas. |
| payment_ID | int unsigned | No | — (no declarado) | — | fk_refunds_payment → tb_payments.ID | — | — | Identificador que referencia tb_payments.ID y vincula este registro con la entidad relacionada. |
| amount | decimal(12,2) | No | — (no declarado) | — | — | — | — | Importe del pago o reembolso, según la tabla donde aparece. |
| reason | text | Sí | — (no declarado) | — | — | — | — | Motivo proporcionado para la solicitud o el evento asociado al registro. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_refunds_payment: (payment_ID)

**Claves foráneas:** fk_refunds_payment: (payment_ID) → tb_payments(ID)
### tb_returns

- **Descripción:** Solicitudes de devolución vinculadas a una orden y a quien las solicita, con motivo y estado.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de solicitudes de devolución vinculadas a una orden y a quien las solicita, con motivo y estado. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_returns_order_hdr → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| requested_by | int | No | — (no declarado) | — | fk_returns_user → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| reason | text | No | — (no declarado) | — | — | — | — | Motivo proporcionado para la solicitud o el evento asociado al registro. |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_returns_order_hdr: (order_ID); fk_returns_user: (requested_by)

**Claves foráneas:** fk_returns_order_hdr: (order_ID) → tb_orders(ID); fk_returns_user: (requested_by) → tb_user(ID)
### tb_shipments

- **Descripción:** Información de envío de órdenes, con transportista, número de seguimiento, estado y fechas de entrega.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de información de envío de órdenes, con transportista, número de seguimiento, estado y fechas de entrega. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_shipments_order → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| tracking_number | varchar(100) | Sí | NULL | — | — | — | — | Número de seguimiento del envío. |
| carrier | varchar(100) | Sí | NULL | — | — | — | — | Nombre del transportista asociado al envío. |
| shipping_status | enum('Preparing','In_Transit','Delivered','Failed') | No | 'Preparing' | — | — | — | — | Estado del envío; las opciones permitidas están definidas por el ENUM. |
| shipped_date | datetime | Sí | NULL | — | — | — | — | Fecha y hora en que se registró la salida del envío. |
| delivered_date | datetime | Sí | NULL | — | — | — | — | Fecha y hora en que se registró la entrega. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_shipments_order: (order_ID)

**Claves foráneas:** fk_shipments_order: (order_ID) → tb_orders(ID)
### tb_user

- **Descripción:** Cuentas de usuario con datos de acceso, estado y fechas de actividad.
- **Registros en el respaldo:** 7,528
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=7532 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int | No | — (no declarado) | Sí | — | Sí | — | Identificador único de cuentas de usuario con datos de acceso, estado y fechas de actividad. |
| email | varchar(100) | No | — (no declarado) | — | — | — | — | Dirección de correo electrónico asociada a la cuenta. |
| nick | varchar(50) | No | — (no declarado) | — | — | — | — | Apodo o nombre de usuario de la cuenta. |
| password | varchar(255) | No | — (no declarado) | — | — | — | — | Valor de credencial almacenado para la cuenta; el esquema no especifica su formato ni método de protección. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |
| last_login | datetime | Sí | NULL | — | — | — | — | Fecha y hora del último inicio de sesión registrado para la cuenta. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |

**Índices:** email: (email) UNIQUE; nick: (nick) UNIQUE

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_user_addresses

- **Descripción:** Direcciones asociadas a usuarios para entrega, con destinatario, instrucciones y coordenadas opcionales.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de direcciones asociadas a usuarios para entrega, con destinatario, instrucciones y coordenadas opcionales. |
| user_ID | int | No | — (no declarado) | — | fk_addresses_users → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| address_label | varchar(100) | No | — (no declarado) | — | — | — | — | Etiqueta que permite distinguir la dirección, por ejemplo, según el uso que le asigne la aplicación. |
| recipient_name | varchar(150) | Sí | NULL | — | — | — | — | Nombre de la persona destinataria de la dirección. |
| recipient_phone | varchar(25) | Sí | NULL | — | — | — | — | Teléfono de contacto de la persona destinataria. |
| delivery_instructions | varchar(500) | Sí | NULL | — | — | — | — | Indicaciones adicionales para realizar la entrega. |
| latitude | decimal(10,7) | Sí | NULL | — | — | — | — | Coordenada de latitud asociada a la dirección. |
| longitude | decimal(10,7) | Sí | NULL | — | — | — | — | Coordenada de longitud asociada a la dirección. |
| is_default | tinyint(1) | No | '0' | — | — | — | — | Indicador que marca si la dirección o método está seleccionado como predeterminado. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |
| default_user_ID | int | Sí | — (no declarado) | — | — | — | — | Identificador de usuario asociado a la configuración de dirección predeterminada; el respaldo no declara una clave foránea para este campo. |

**Índices:** uq_tb_user_addresses_default_user: (default_user_ID) UNIQUE; idx_user_addresses: (user_ID)

**Claves foráneas:** fk_addresses_users: (user_ID) → tb_user(ID)
### tbc_payment_methods_types

- **Descripción:** Catálogo de tipos de método de pago con nombre, descripción y estado.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de catálogo de tipos de método de pago con nombre, descripción y estado. |
| name | varchar(50) | No | — (no declarado) | — | — | — | — | Nombre legible de la entidad o elemento del catálogo. |
| description | varchar(255) | Sí | NULL | — | — | — | — | Texto descriptivo asociado a la entidad; su contenido lo proporciona la aplicación. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** Sin índices secundarios declarados.

**Claves foráneas:** Sin claves foráneas declaradas.
### tbd_address_components

- **Descripción:** Componentes individuales de una dirección, con tipo, valor y relaciones a la dirección y a un componente superior.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de componentes individuales de una dirección, con tipo, valor y relaciones a la dirección y a un componente superior. |
| address_ID | bigint unsigned | No | — (no declarado) | — | fk_component_address → tb_user_addresses.ID; fk_component_parent → tbd_address_components.address_ID | — | — | Componente de una clave foránea compuesta que vincula esta fila con tb_user_addresses.ID; tbd_address_components.address_ID, ID. |
| value | varchar(255) | No | — (no declarado) | — | — | — | — | Valor de texto del componente de dirección. |
| component_type | varchar(50) | No | — (no declarado) | — | — | — | — | Tipo de componente de dirección, expresado como texto. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| address_sup_ID | bigint unsigned | Sí | NULL | — | fk_component_parent → tbd_address_components.ID | — | — | Componente de una clave foránea compuesta que vincula esta fila con tbd_address_components.address_ID, ID. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** uk_address_component: (address_ID, ID) UNIQUE; idx_address_parent: (address_ID, address_sup_ID)

**Claves foráneas:** fk_component_address: (address_ID) → tb_user_addresses(ID); fk_component_parent: (address_ID, address_sup_ID) → tbd_address_components(address_ID, ID)
### tbd_cancellation_items

- **Descripción:** Detalle auxiliar relacionado con una solicitud de cancelación, la orden y el usuario que la solicita.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de detalle auxiliar relacionado con una solicitud de cancelación, la orden y el usuario que la solicita. |
| cancellation_ID | int unsigned | Sí | NULL | — | fk_cancellation_items_header → tb_order_cancellations.ID | — | — | Identificador que referencia tb_order_cancellations.ID y vincula este registro con la entidad relacionada. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_cancellations_order → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| reason | text | No | — (no declarado) | — | — | — | — | Motivo proporcionado para la solicitud o el evento asociado al registro. |
| requested_by | int | No | — (no declarado) | — | fk_cancellations_user → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_cancellations_order: (order_ID); fk_cancellations_user: (requested_by); fk_cancellation_items_header: (cancellation_ID)

**Claves foráneas:** fk_cancellation_items_header: (cancellation_ID) → tb_order_cancellations(ID); fk_cancellations_order: (order_ID) → tb_orders(ID); fk_cancellations_user: (requested_by) → tb_user(ID)
### tbd_cart_items

- **Descripción:** Productos y proveedores incluidos en un carrito, con la cantidad solicitada.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** cart_ID, provider_ID, product_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| cart_ID | int unsigned | No | — (no declarado) | Sí | fk_cart_items_cart → tb_carts.ID | — | — | Identificador que referencia tb_carts.ID y vincula este registro con la entidad relacionada. |
| provider_ID | int | No | — (no declarado) | Sí | fk_cart_items_provider_product → tb_products_users_providers.user_ID | — | — | Componente de una clave foránea compuesta que vincula esta fila con tb_products_users_providers.user_ID, product_ID. |
| product_ID | int unsigned | No | — (no declarado) | Sí | fk_cart_items_provider_product → tb_products_users_providers.product_ID | — | — | Componente de una clave foránea compuesta que vincula esta fila con tb_products_users_providers.user_ID, product_ID. |
| quantity | int unsigned | No | '1' | — | — | — | — | Cantidad de unidades del producto en el carrito o renglón. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** idx_cart_items_provider_product: (provider_ID, product_ID)

**Claves foráneas:** fk_cart_items_cart: (cart_ID) → tb_carts(ID); fk_cart_items_provider_product: (provider_ID, product_ID) → tb_products_users_providers(user_ID, product_ID)
### tbd_order_items

- **Descripción:** Renglones de una orden con datos del producto, proveedor, cantidad, precio unitario e importe subtotal.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de renglones de una orden con datos del producto, proveedor, cantidad, precio unitario e importe subtotal. |
| seller_order_ID | int unsigned | No | — (no declarado) | — | tbd_order_items_ibfk_1 → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| product_ID | int unsigned | No | — (no declarado) | — | tbd_order_items_ibfk_2 → tb_products_users_providers.product_ID | — | — | Componente de una clave foránea compuesta que vincula esta fila con tb_products_users_providers.product_ID, user_ID. |
| provider_ID | int | No | — (no declarado) | — | tbd_order_items_ibfk_2 → tb_products_users_providers.user_ID | — | — | Componente de una clave foránea compuesta que vincula esta fila con tb_products_users_providers.product_ID, user_ID. |
| product_name | varchar(255) | No | — (no declarado) | — | — | — | — | Nombre del producto guardado en el renglón de la orden. |
| quantity | int unsigned | No | — (no declarado) | — | — | — | — | Cantidad de unidades del producto en el carrito o renglón. |
| unit_price | decimal(12,2) | No | — (no declarado) | — | — | — | — | Precio por unidad del producto en el renglón de la orden. |
| subtotal | decimal(12,2) | Sí | — (no declarado) | — | — | — | — | Importe subtotal asociado a la orden o renglón, expresado en la moneda que gestione la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** seller_order_ID: (seller_order_ID); product_ID_provider_ID: (product_ID, provider_ID)

**Claves foráneas:** tbd_order_items_ibfk_1: (seller_order_ID) → tb_orders(ID); tbd_order_items_ibfk_2: (product_ID, provider_ID) → tb_products_users_providers(product_ID, user_ID)
### tbd_return_items

- **Descripción:** Detalle asociado a una devolución y su orden, con motivo y estado.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de detalle asociado a una devolución y su orden, con motivo y estado. |
| return_ID | int unsigned | Sí | NULL | — | fk_return_items_header → tb_returns.ID | — | — | Identificador que referencia tb_returns.ID y vincula este registro con la entidad relacionada. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_returns_order → tb_orders.ID | — | — | Identificador que referencia tb_orders.ID y vincula este registro con la entidad relacionada. |
| reason | text | No | — (no declarado) | — | — | — | — | Motivo proporcionado para la solicitud o el evento asociado al registro. |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_returns_order: (order_ID); fk_return_items_header: (return_ID)

**Claves foráneas:** fk_return_items_header: (return_ID) → tb_returns(ID); fk_returns_order: (order_ID) → tb_orders(ID)
### tbd_user_payment_methods

- **Descripción:** Métodos de pago vinculados a usuarios, con proveedor, referencia, etiqueta y últimos dígitos almacenados.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Identificador único de métodos de pago vinculados a usuarios, con proveedor, referencia, etiqueta y últimos dígitos almacenados. |
| user_ID | int | No | — (no declarado) | — | tbd_user_payment_methods_ibfk_1 → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| payment_method_type_ID | int unsigned | No | — (no declarado) | — | tbd_user_payment_methods_ibfk_2 → tbc_payment_methods_types.ID | — | — | Identificador que referencia tbc_payment_methods_types.ID y vincula este registro con la entidad relacionada. |
| provider | varchar(60) | No | — (no declarado) | — | — | — | — | Nombre del proveedor de pago registrado para el método. |
| provider_method_ref | varchar(255) | No | — (no declarado) | — | — | — | — | Referencia del método de pago en el proveedor externo; el esquema no define su formato. |
| label | varchar(100) | Sí | NULL | — | — | — | — | Etiqueta descriptiva asignada por el usuario al método de pago. |
| last_four | char(4) | Sí | NULL | — | — | — | — | Últimos cuatro caracteres almacenados para identificar el método de pago. |
| is_default | tinyint(1) | No | '0' | — | — | — | — | Indicador que marca si la dirección o método está seleccionado como predeterminado. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** uk_provider_method: (provider, provider_method_ref) UNIQUE; user_ID: (user_ID); payment_method_type_ID: (payment_method_type_ID)

**Claves foráneas:** tbd_user_payment_methods_ibfk_1: (user_ID) → tb_user(ID); tbd_user_payment_methods_ibfk_2: (payment_method_type_ID) → tbc_payment_methods_types(ID)
### tbd_users_wishlist_products

- **Descripción:** Tabla de asociación entre usuarios y productos guardados en su lista de deseos.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** user_ID, product_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| user_ID | int | No | — (no declarado) | Sí | fk_user2 → tb_user.ID | — | — | Identificador que referencia tb_user.ID y vincula este registro con la entidad relacionada. |
| product_ID | int unsigned | No | — (no declarado) | Sí | fk_products3 → tb_products.ID | — | — | Identificador que referencia tb_products.ID y vincula este registro con la entidad relacionada. |
| status | bit(1) | No | b'1' | — | — | — | — | Indicador binario del estado del registro; el significado de cada valor depende de la aplicación. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Fecha y hora de creación del registro. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Fecha y hora de la última actualización registrada. |

**Índices:** fk_products3: (product_ID)

**Claves foráneas:** fk_products3: (product_ID) → tb_products(ID); fk_user2: (user_ID) → tb_user(ID)

## Relaciones declaradas

Solo se documentan relaciones `FOREIGN KEY` explícitas; no se infieren relaciones por nombres de columnas.

| Desde | Hacia | Cardinalidad | Restricción | ON DELETE | ON UPDATE |
|---|---|---|---|---|---|
| tb_carts.user_ID | tb_user.ID | 1:1 | tb_carts_ibfk_1 | No declarado | No declarado |
| tb_categories.sup_id_category | tb_categories.ID | N:1 | fk_superior_category | No declarado | No declarado |
| tb_order_cancellations.order_ID | tb_orders.ID | N:1 | fk_order_cancellations_order | No declarado | No declarado |
| tb_order_cancellations.requested_by | tb_user.ID | N:1 | fk_order_cancellations_user | No declarado | No declarado |
| tb_orders.seller_ID | tb_user.ID | N:1 | tb_orders_ibfk_1 | No declarado | No declarado |
| tb_payment_transaction.payment_ID | tb_payments.ID | N:1 | fk_trans_payment | No declarado | No declarado |
| tb_payments.order_ID | tb_orders.ID | N:1 | fk_payments_order | No declarado | No declarado |
| tb_payments.user_payment_method_ID | tbd_user_payment_methods.ID | N:1 | fk_payments_user_method | No declarado | No declarado |
| tb_people.user_ID | tb_user.ID | 1:1 | fk_people_users | No declarado | No declarado |
| tb_product_categories.category_Id | tb_categories.ID | N:1 | fk_pc_category | CASCADE | CASCADE |
| tb_product_categories.product_Id | tb_products.ID | N:1 | fk_pc_product | CASCADE | CASCADE |
| tb_products_users_providers.product_ID | tb_products.ID | N:1 | fk_products_users_providers_product | No declarado | No declarado |
| tb_products_users_providers.user_ID | tb_user.ID | N:1 | fk_products_users_providers_user | No declarado | No declarado |
| tb_refunds.payment_ID | tb_payments.ID | N:1 | fk_refunds_payment | No declarado | No declarado |
| tb_returns.order_ID | tb_orders.ID | N:1 | fk_returns_order_hdr | No declarado | No declarado |
| tb_returns.requested_by | tb_user.ID | N:1 | fk_returns_user | No declarado | No declarado |
| tb_shipments.order_ID | tb_orders.ID | N:1 | fk_shipments_order | No declarado | No declarado |
| tb_user_addresses.user_ID | tb_user.ID | N:1 | fk_addresses_users | No declarado | No declarado |
| tbd_address_components.address_ID | tb_user_addresses.ID | N:1 | fk_component_address | RESTRICT | No declarado |
| tbd_address_components.address_ID, address_sup_ID | tbd_address_components.address_ID, ID | N:1 | fk_component_parent | RESTRICT | No declarado |
| tbd_cancellation_items.cancellation_ID | tb_order_cancellations.ID | N:1 | fk_cancellation_items_header | No declarado | No declarado |
| tbd_cancellation_items.order_ID | tb_orders.ID | N:1 | fk_cancellations_order | No declarado | No declarado |
| tbd_cancellation_items.requested_by | tb_user.ID | N:1 | fk_cancellations_user | No declarado | No declarado |
| tbd_cart_items.cart_ID | tb_carts.ID | N:1 | fk_cart_items_cart | No declarado | No declarado |
| tbd_cart_items.provider_ID, product_ID | tb_products_users_providers.user_ID, product_ID | N:1 | fk_cart_items_provider_product | No declarado | No declarado |
| tbd_order_items.seller_order_ID | tb_orders.ID | N:1 | tbd_order_items_ibfk_1 | No declarado | No declarado |
| tbd_order_items.product_ID, provider_ID | tb_products_users_providers.product_ID, user_ID | N:1 | tbd_order_items_ibfk_2 | No declarado | No declarado |
| tbd_return_items.return_ID | tb_returns.ID | N:1 | fk_return_items_header | No declarado | No declarado |
| tbd_return_items.order_ID | tb_orders.ID | N:1 | fk_returns_order | No declarado | No declarado |
| tbd_user_payment_methods.user_ID | tb_user.ID | N:1 | tbd_user_payment_methods_ibfk_1 | No declarado | No declarado |
| tbd_user_payment_methods.payment_method_type_ID | tbc_payment_methods_types.ID | N:1 | tbd_user_payment_methods_ibfk_2 | No declarado | No declarado |
| tbd_users_wishlist_products.product_ID | tb_products.ID | N:1 | fk_products3 | No declarado | No declarado |
| tbd_users_wishlist_products.user_ID | tb_user.ID | N:1 | fk_user2 | No declarado | No declarado |

## Vistas, procedimientos, funciones y triggers

- **Vistas (29):** vw_address_hierarchical_details, vw_people_details, vw_total_products_by_category, vw_trazabilidad_tb_carts, vw_trazabilidad_tb_categories, vw_trazabilidad_tb_order_cancellations, vw_trazabilidad_tb_orders, vw_trazabilidad_tb_payment_methods, vw_trazabilidad_tb_payment_transaction, vw_trazabilidad_tb_payments, vw_trazabilidad_tb_people, vw_trazabilidad_tb_product_categories, vw_trazabilidad_tb_products, vw_trazabilidad_tb_products_users_providers, vw_trazabilidad_tb_refunds, vw_trazabilidad_tb_returns, vw_trazabilidad_tb_shipments, vw_trazabilidad_tb_user, vw_trazabilidad_tb_user_addresses, vw_trazabilidad_tbc_payment_methods_types, vw_trazabilidad_tbd_address_components, vw_trazabilidad_tbd_cancellation_items, vw_trazabilidad_tbd_cart_items, vw_trazabilidad_tbd_order_items, vw_trazabilidad_tbd_return_items, vw_trazabilidad_tbd_user_payment_methods, vw_trazabilidad_tbd_users_wishlist_products, vw_user_default_shipping_addresses, vw_wishlist_carritos
- **Procedimientos (3):** sp_register_new_user, sp_restore_product, sp_soft_delete_product
- **Funciones (0):** Ninguna
- **Triggers (72):** trg_tb_carts_ad, trg_tb_carts_ai, trg_tb_carts_au, trg_tb_order_cancellations_ad, trg_tb_order_cancellations_ai, trg_tb_order_cancellations_au, trg_tb_orders_ad, trg_tb_orders_ai, trg_tb_orders_au, trg_tb_payment_methods_ad, trg_tb_payment_methods_ai, trg_tb_payment_methods_au, trg_tb_payment_transaction_ad, trg_tb_payment_transaction_ai, trg_tb_payment_transaction_au, trg_tb_payments_ad, trg_tb_payments_ai, trg_tb_payments_au, trg_tb_people_ad, trg_tb_people_ai, trg_tb_people_au, trg_tb_product_categories_after_delete, trg_tb_product_categories_after_insert, trg_tb_product_categories_after_update, trg_tb_products_after_delete, trg_tb_products_after_insert, trg_tb_products_after_update, trg_tb_refunds_ad, trg_tb_refunds_ai, trg_tb_refunds_au, trg_tb_returns_ad, trg_tb_returns_ai, trg_tb_returns_au, trg_tb_shipments_ad, trg_tb_shipments_ai, trg_tb_shipments_au, trg_tb_user_addresses_ad, trg_tb_user_addresses_ai, trg_tb_user_addresses_au, trg_tbc_categories_after_delete, trg_tbc_categories_after_insert, trg_tbc_categories_after_update, trg_tbc_payment_methods_types_ad, trg_tbc_payment_methods_types_ai, trg_tbc_payment_methods_types_au, trg_tbd_address_components_ad, trg_tbd_address_components_ai, trg_tbd_address_components_au, trg_tbd_cancellation_items_ad, trg_tbd_cancellation_items_ai, trg_tbd_cancellation_items_au, trg_tbd_cart_items_ad, trg_tbd_cart_items_ai, trg_tbd_cart_items_au, trg_tbd_order_items_ad, trg_tbd_order_items_ai, trg_tbd_order_items_au, trg_tbd_products_users_providers_ad, trg_tbd_products_users_providers_ai, trg_tbd_products_users_providers_au, trg_tbd_return_items_ad, trg_tbd_return_items_ai, trg_tbd_return_items_au, trg_tbd_user_payment_methods_ad, trg_tbd_user_payment_methods_ai, trg_tbd_user_payment_methods_au, trg_tbd_users_wishlist_products_ad, trg_tbd_users_wishlist_products_ai, trg_tbd_users_wishlist_products_au, trq_user_after_delete, trq_user_after_insert, trq_user_after_update

## Exportar a PDF

Abre `index.html` en un navegador y pulsa **Imprimir / guardar como PDF**. En el diálogo del navegador selecciona “Guardar como PDF”. La página no usa animaciones ni dependencias externas.
