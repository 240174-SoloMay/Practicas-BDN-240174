# Diccionario de Datos — db_test_7b

**Proyecto:** Practicas-BDN-240174  
**Motor / versión:** MySQL 8.0.46  
**Respaldo de referencia:** `respaldo_111126_1794591103484.sql`  
**SHA-256:** `335554beff65d9117b70947d65cda5a562b575b31c8420f77ac79d1fb8466b12`  
**Charset / collation:** `utf8mb4` / `utf8mb4_0900_ai_ci`

## Alcance y verificación

Se contrastaron nombres y orden de columnas, claves primarias y foráneas, índices y cantidades por tabla contra el respaldo SQL. No se ejecutó el SQL ni se consultó una base de datos. Los conteos corresponden a filas incluidas en el respaldo, no a una consulta en vivo. Las 25 tablas tienen una sección de datos en el archivo; cuando no hay sentencias `INSERT`, el conteo es 0. El respaldo no declara `COMMENT` para ninguna tabla ni columna, por lo que se señala la ausencia de descripción declarada, sin inferirla.

**Resumen:** 25 tablas · 190 columnas · 33 relaciones FK · 97,472 filas incluidas en el respaldo.

## Índice

- [tb_carts](#tb_carts) — 0 registros
- [tb_categories](#tb_categories) — 100 registros
- [tb_logs](#tb_logs) — 49.745 registros
- [tb_order_cancellations](#tb_order_cancellations) — 0 registros
- [tb_orders](#tb_orders) — 0 registros
- [tb_payment_methods](#tb_payment_methods) — 0 registros
- [tb_payment_transaction](#tb_payment_transaction) — 0 registros
- [tb_payments](#tb_payments) — 0 registros
- [tb_people](#tb_people) — 7.503 registros
- [tb_product_categories](#tb_product_categories) — 17.572 registros
- [tb_products](#tb_products) — 15.024 registros
- [tb_products_users_providers](#tb_products_users_providers) — 0 registros
- [tb_refunds](#tb_refunds) — 0 registros
- [tb_returns](#tb_returns) — 0 registros
- [tb_shipments](#tb_shipments) — 0 registros
- [tb_user](#tb_user) — 7.528 registros
- [tb_user_addresses](#tb_user_addresses) — 0 registros
- [tbc_payment_methods_types](#tbc_payment_methods_types) — 0 registros
- [tbd_address_components](#tbd_address_components) — 0 registros
- [tbd_cancellation_items](#tbd_cancellation_items) — 0 registros
- [tbd_cart_items](#tbd_cart_items) — 0 registros
- [tbd_order_items](#tbd_order_items) — 0 registros
- [tbd_return_items](#tbd_return_items) — 0 registros
- [tbd_user_payment_methods](#tbd_user_payment_methods) — 0 registros
- [tbd_users_wishlist_products](#tbd_users_wishlist_products) — 0 registros

## Tablas y columnas

“— (no declarado)” en DEFAULT significa que el respaldo no especifica un valor predeterminado. PK indica clave primaria; FK incluye restricción y columna referenciada.

### tb_carts

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| user_ID | int | No | — (no declarado) | — | tb_carts_ibfk_1 → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** uk_cart_user: (user_ID) UNIQUE

**Claves foráneas:** tb_carts_ibfk_1: (user_ID) → tb_user(ID)
### tb_categories

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 100
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| name | varchar(120) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| description | text | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| sup_id_category | int unsigned | Sí | NULL | — | fk_superior_category → tb_categories.ID | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | No | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** name: (name) UNIQUE; fk_superior_category: (sup_id_category)

**Claves foráneas:** fk_superior_category: (sup_id_category) → tb_categories(ID)
### tb_logs

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 49.745
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=54859 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| table_name | varchar(80) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| record_id | int unsigned | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| table_operation | enum('Create','Read','Update','Delete') | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| db_user | varchar(288) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| operation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| operation_description | text | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| operation_status | bit(1) | Sí | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |

**Índices:** idx_logs_table_op: (table_name, table_operation); idx_logs_tabla_registro: (table_name, record_id)

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_order_cancellations

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_order_cancellations_order → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| requested_by | int | No | — (no declarado) | — | fk_order_cancellations_user → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| reason | text | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_order_cancellations_order: (order_ID); fk_order_cancellations_user: (requested_by)

**Claves foráneas:** fk_order_cancellations_order: (order_ID) → tb_orders(ID); fk_order_cancellations_user: (requested_by) → tb_user(ID)
### tb_orders

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| seller_ID | int | No | — (no declarado) | — | tb_orders_ibfk_1 → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| subtotal | decimal(12,2) | No | '0.00' | — | — | — | — | Sin descripción declarada en el respaldo. |
| shipping_cost | decimal(12,2) | No | '0.00' | — | — | — | — | Sin descripción declarada en el respaldo. |
| fulfillment_status | enum('Pending','Accepted','Preparing','Sent','Delivered','Canceled','Returned') | No | 'Pending' | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** seller_ID: (seller_ID)

**Claves foráneas:** tb_orders_ibfk_1: (seller_ID) → tb_user(ID)
### tb_payment_methods

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| name | varchar(100) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| description | text | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** Sin índices secundarios declarados.

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_payment_transaction

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| payment_ID | int unsigned | No | — (no declarado) | — | fk_trans_payment → tb_payments.ID | — | — | Sin descripción declarada en el respaldo. |
| transaction_reference | varchar(255) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| gateway_response | text | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_trans_payment: (payment_ID)

**Claves foráneas:** fk_trans_payment: (payment_ID) → tb_payments(ID)
### tb_payments

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_payments_order → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| user_payment_method_ID | bigint unsigned | Sí | NULL | — | fk_payments_user_method → tbd_user_payment_methods.ID | — | — | Sin descripción declarada en el respaldo. |
| amount | decimal(12,2) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| payment_status | enum('Pending','Approved','Rejected','Refunded') | No | 'Pending' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_payments_order: (order_ID); fk_payments_user_method: (user_payment_method_ID)

**Claves foráneas:** fk_payments_order: (order_ID) → tb_orders(ID); fk_payments_user_method: (user_payment_method_ID) → tbd_user_payment_methods(ID)
### tb_people

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 7.503
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=7504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** person_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| person_ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| user_ID | int | Sí | NULL | — | fk_people_users → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| courtesy_title | varchar(20) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| given_names | varchar(150) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| family_names | varchar(150) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| birth_date | date | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| gender | enum('Hombre','Mujer','Prefiero no decirlo') | No | 'Prefiero no decirlo' | — | — | — | — | Sin descripción declarada en el respaldo. |
| country_code | char(2) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| phone | varchar(25) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | Sí | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** user_ID: (user_ID) UNIQUE

**Claves foráneas:** fk_people_users: (user_ID) → tb_user(ID)
### tb_product_categories

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 17.572
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** product_Id, category_Id

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| product_Id | int unsigned | No | — (no declarado) | Sí | fk_pc_product → tb_products.ID | — | — | Sin descripción declarada en el respaldo. |
| category_Id | int unsigned | No | — (no declarado) | Sí | fk_pc_category → tb_categories.ID | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | No | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** idx_pc_category: (category_Id)

**Claves foráneas:** fk_pc_category: (category_Id) → tb_categories(ID); fk_pc_product: (product_Id) → tb_products(ID)
### tb_products

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 15.024
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=24626 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| SKU | varchar(50) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| name | varchar(250) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| description | text | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| current_price | decimal(10,2) | No | '0.00' | — | — | — | — | Sin descripción declarada en el respaldo. |
| current_stock | int unsigned | No | '0' | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | No | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** SKU: (SKU) UNIQUE

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_products_users_providers

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** user_ID, product_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| user_ID | int | No | — (no declarado) | Sí | fk_products_users_providers_user → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| product_ID | int unsigned | No | — (no declarado) | Sí | fk_products_users_providers_product → tb_products.ID | — | — | Sin descripción declarada en el respaldo. |
| type_ownership | enum('Owner','Reseller','Distributor') | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| available_date | datetime | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |

**Índices:** idx_products_users_providers_product: (product_ID)

**Claves foráneas:** fk_products_users_providers_product: (product_ID) → tb_products(ID); fk_products_users_providers_user: (user_ID) → tb_user(ID)
### tb_refunds

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| payment_ID | int unsigned | No | — (no declarado) | — | fk_refunds_payment → tb_payments.ID | — | — | Sin descripción declarada en el respaldo. |
| amount | decimal(12,2) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| reason | text | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_refunds_payment: (payment_ID)

**Claves foráneas:** fk_refunds_payment: (payment_ID) → tb_payments(ID)
### tb_returns

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_returns_order_hdr → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| requested_by | int | No | — (no declarado) | — | fk_returns_user → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| reason | text | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_returns_order_hdr: (order_ID); fk_returns_user: (requested_by)

**Claves foráneas:** fk_returns_order_hdr: (order_ID) → tb_orders(ID); fk_returns_user: (requested_by) → tb_user(ID)
### tb_shipments

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_shipments_order → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| tracking_number | varchar(100) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| carrier | varchar(100) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| shipping_status | enum('Preparing','In_Transit','Delivered','Failed') | No | 'Preparing' | — | — | — | — | Sin descripción declarada en el respaldo. |
| shipped_date | datetime | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| delivered_date | datetime | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_shipments_order: (order_ID)

**Claves foráneas:** fk_shipments_order: (order_ID) → tb_orders(ID)
### tb_user

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 7.528
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB AUTO_INCREMENT=7532 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| email | varchar(100) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| nick | varchar(50) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| password | varchar(255) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |
| last_login | datetime | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | Sí | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |

**Índices:** email: (email) UNIQUE; nick: (nick) UNIQUE

**Claves foráneas:** Sin claves foráneas declaradas.
### tb_user_addresses

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| user_ID | int | No | — (no declarado) | — | fk_addresses_users → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| address_label | varchar(100) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| recipient_name | varchar(150) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| recipient_phone | varchar(25) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| delivery_instructions | varchar(500) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| latitude | decimal(10,7) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| longitude | decimal(10,7) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| is_default | tinyint(1) | No | '0' | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |
| default_user_ID | int | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |

**Índices:** uq_tb_user_addresses_default_user: (default_user_ID) UNIQUE; idx_user_addresses: (user_ID)

**Claves foráneas:** fk_addresses_users: (user_ID) → tb_user(ID)
### tbc_payment_methods_types

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| name | varchar(50) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| description | varchar(255) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | CURRENT_TIMESTAMP | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** Sin índices secundarios declarados.

**Claves foráneas:** Sin claves foráneas declaradas.
### tbd_address_components

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| address_ID | bigint unsigned | No | — (no declarado) | — | fk_component_address → tb_user_addresses.ID; fk_component_parent → tbd_address_components.address_ID | — | — | Sin descripción declarada en el respaldo. |
| value | varchar(255) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| component_type | varchar(50) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| address_sup_ID | bigint unsigned | Sí | NULL | — | fk_component_parent → tbd_address_components.ID | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** uk_address_component: (address_ID, ID) UNIQUE; idx_address_parent: (address_ID, address_sup_ID)

**Claves foráneas:** fk_component_address: (address_ID) → tb_user_addresses(ID); fk_component_parent: (address_ID, address_sup_ID) → tbd_address_components(address_ID, ID)
### tbd_cancellation_items

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| cancellation_ID | int unsigned | Sí | NULL | — | fk_cancellation_items_header → tb_order_cancellations.ID | — | — | Sin descripción declarada en el respaldo. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_cancellations_order → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| reason | text | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| requested_by | int | No | — (no declarado) | — | fk_cancellations_user → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_cancellations_order: (order_ID); fk_cancellations_user: (requested_by); fk_cancellation_items_header: (cancellation_ID)

**Claves foráneas:** fk_cancellation_items_header: (cancellation_ID) → tb_order_cancellations(ID); fk_cancellations_order: (order_ID) → tb_orders(ID); fk_cancellations_user: (requested_by) → tb_user(ID)
### tbd_cart_items

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** cart_ID, provider_ID, product_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| cart_ID | int unsigned | No | — (no declarado) | Sí | fk_cart_items_cart → tb_carts.ID | — | — | Sin descripción declarada en el respaldo. |
| provider_ID | int | No | — (no declarado) | Sí | fk_cart_items_provider_product → tb_products_users_providers.user_ID | — | — | Sin descripción declarada en el respaldo. |
| product_ID | int unsigned | No | — (no declarado) | Sí | fk_cart_items_provider_product → tb_products_users_providers.product_ID | — | — | Sin descripción declarada en el respaldo. |
| quantity | int unsigned | No | '1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** idx_cart_items_provider_product: (provider_ID, product_ID)

**Claves foráneas:** fk_cart_items_cart: (cart_ID) → tb_carts(ID); fk_cart_items_provider_product: (provider_ID, product_ID) → tb_products_users_providers(user_ID, product_ID)
### tbd_order_items

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| seller_order_ID | int unsigned | No | — (no declarado) | — | tbd_order_items_ibfk_1 → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| product_ID | int unsigned | No | — (no declarado) | — | tbd_order_items_ibfk_2 → tb_products_users_providers.product_ID | — | — | Sin descripción declarada en el respaldo. |
| provider_ID | int | No | — (no declarado) | — | tbd_order_items_ibfk_2 → tb_products_users_providers.user_ID | — | — | Sin descripción declarada en el respaldo. |
| product_name | varchar(255) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| quantity | int unsigned | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| unit_price | decimal(12,2) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| subtotal | decimal(12,2) | Sí | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** seller_order_ID: (seller_order_ID); product_ID_provider_ID: (product_ID, provider_ID)

**Claves foráneas:** tbd_order_items_ibfk_1: (seller_order_ID) → tb_orders(ID); tbd_order_items_ibfk_2: (product_ID, provider_ID) → tb_products_users_providers(product_ID, user_ID)
### tbd_return_items

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | int unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| return_ID | int unsigned | Sí | NULL | — | fk_return_items_header → tb_returns.ID | — | — | Sin descripción declarada en el respaldo. |
| order_ID | int unsigned | No | — (no declarado) | — | fk_returns_order → tb_orders.ID | — | — | Sin descripción declarada en el respaldo. |
| reason | text | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** fk_returns_order: (order_ID); fk_return_items_header: (return_ID)

**Claves foráneas:** fk_return_items_header: (return_ID) → tb_returns(ID); fk_returns_order: (order_ID) → tb_orders(ID)
### tbd_user_payment_methods

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — (no declarado) | Sí | — | Sí | — | Sin descripción declarada en el respaldo. |
| user_ID | int | No | — (no declarado) | — | tbd_user_payment_methods_ibfk_1 → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| payment_method_type_ID | int unsigned | No | — (no declarado) | — | tbd_user_payment_methods_ibfk_2 → tbc_payment_methods_types.ID | — | — | Sin descripción declarada en el respaldo. |
| provider | varchar(60) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| provider_method_ref | varchar(255) | No | — (no declarado) | — | — | — | — | Sin descripción declarada en el respaldo. |
| label | varchar(100) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_four | char(4) | Sí | NULL | — | — | — | — | Sin descripción declarada en el respaldo. |
| is_default | tinyint(1) | No | '0' | — | — | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

**Índices:** uk_provider_method: (provider, provider_method_ref) UNIQUE; user_ID: (user_ID); payment_method_type_ID: (payment_method_type_ID)

**Claves foráneas:** tbd_user_payment_methods_ibfk_1: (user_ID) → tb_user(ID); tbd_user_payment_methods_ibfk_2: (payment_method_type_ID) → tbc_payment_methods_types(ID)
### tbd_users_wishlist_products

- **Descripción:** Sin descripción declarada en el respaldo.
- **Registros en el respaldo:** 0
- **Motor:** InnoDB · **Opciones:** `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci` · **PK:** user_ID, product_ID

| Columna | Tipo | NULL | DEFAULT | PK | FK / referencia | AUTO_INCREMENT | ON UPDATE | Descripción |
|---|---|---|---|---|---|---|---|---|
| user_ID | int | No | — (no declarado) | Sí | fk_user2 → tb_user.ID | — | — | Sin descripción declarada en el respaldo. |
| product_ID | int unsigned | No | — (no declarado) | Sí | fk_products3 → tb_products.ID | — | — | Sin descripción declarada en el respaldo. |
| status | bit(1) | No | b'1' | — | — | — | — | Sin descripción declarada en el respaldo. |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — | — | Sin descripción declarada en el respaldo. |
| last_update | datetime | Sí | NULL | — | — | — | CURRENT_TIMESTAMP | Sin descripción declarada en el respaldo. |

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
