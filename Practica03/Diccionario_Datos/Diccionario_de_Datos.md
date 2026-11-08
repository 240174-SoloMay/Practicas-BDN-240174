# Diccionario de Datos — db_test_7b

**Proyecto:** Practicas-BDN-240174  
**Respaldo fuente:** `Practica03/backups/respaldo05_11_26.sql`  
**SHA-256:** `B4E81FD8411D2A859E3A8A261CE57EACF4BCC628E8C9B92F1DE2B101CA2206F9`  
**Fecha de generación:** 7 de noviembre de 2026

## Índice
1. Información general
2. Tablas y columnas
3. Relaciones declaradas
4. Vistas y rutinas
5. Alcance y limitaciones

## Información general
El esquema pertenece a `db_test_7b`, dump MySQL 8.0.46. Presenta objetos de usuarios, productos, categorías, carritos, pedidos, pagos, envíos, devoluciones y trazabilidad; esta clasificación se deriva de nombres y definiciones SQL, sin atribuir reglas comerciales no declaradas. Charset/collation de base: `utf8mb4` / `utf8mb4_0900_ai_ci`. Contiene 25 tablas, 29 vistas y 3 procedimientos; no se hallaron funciones ni triggers. Las tablas usan motor y opciones registrados individualmente en el esquema adjunto del diagrama.

## Tablas y columnas
Las siguientes tablas documentan columnas, tipos completos, nulabilidad, valor predeterminado, PK, FK, AUTO_INCREMENT e índices definidos. `—` indica ausencia de declaración explícita. El inventario detallado que sigue procede directamente del respaldo seleccionado.


## Detalle por tabla

### tb_carts

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| user_ID | int | No | — | — | tb_carts_ibfk_1 | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- uk_cart_user: (user_ID) UNIQUE.

FK declaradas:

- tb_carts_ibfk_1: (user_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_categories

Motor: InnoDB; opciones: AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| name | varchar(120) | No | — | — | — | — |
| sup_id_category | int unsigned DEFAULT | Sí | — | — | fk_superior_category | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |
| last_update | datetime | No | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | — | — | — |

Índices:

- name: (name) UNIQUE.
- fk_superior_category: (sup_id_category).

FK declaradas:

- fk_superior_category: (sup_id_category) → tb_categories(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_logs

Motor: InnoDB; opciones: AUTO_INCREMENT=34857 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int | No | — | Sí | — | Sí |
| table_name | varchar(80) | No | — | — | — | — |
| record_id | int unsigned DEFAULT | Sí | — | — | — | — |
| table_operation | enum('Create','Read','Update','Delete') DEFAULT | Sí | — | — | — | — |
| db_user | varchar(288) | No | — | — | — | — |
| operation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |
| operation_description | text | No | — | — | — | — |

Índices:

- idx_logs_table_op: (table_name, table_operation).
- idx_logs_tabla_registro: (table_name, record_id).

### tb_order_cancellations

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| order_ID | int unsigned | No | — | — | fk_order_cancellations_order | — |
| requested_by | int | No | — | — | fk_order_cancellations_user | — |
| reason | text | No | — | — | — | — |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_order_cancellations_order: (order_ID).
- fk_order_cancellations_user: (requested_by).

FK declaradas:

- fk_order_cancellations_order: (order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_order_cancellations_user: (requested_by) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_orders

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| seller_ID | int | No | — | — | tb_orders_ibfk_1 | — |
| subtotal | decimal(12,2) | No | '0.00' | — | — | — |
| shipping_cost | decimal(12,2) | No | '0.00' | — | — | — |
| fulfillment_status | enum('Pending','Accepted','Preparing','Sent','Delivered','Canceled','Returned') | No | 'Pending' | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- seller_ID: (seller_ID).

FK declaradas:

- tb_orders_ibfk_1: (seller_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_payment_methods

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| name | varchar(100) | No | — | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- Ninguno secundario explícito.

### tb_payment_transaction

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| payment_ID | int unsigned | No | — | — | fk_trans_payment | — |
| transaction_reference | varchar(255) | No | — | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_trans_payment: (payment_ID).

FK declaradas:

- fk_trans_payment: (payment_ID) → tb_payments(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_payments

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| order_ID | int unsigned | No | — | — | fk_payments_order | — |
| user_payment_method_ID | bigint unsigned DEFAULT | Sí | — | — | fk_payments_user_method | — |
| amount | decimal(12,2) | No | — | — | — | — |
| payment_status | enum('Pending','Approved','Rejected','Refunded') | No | 'Pending' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_payments_order: (order_ID).
- fk_payments_user_method: (user_payment_method_ID).

FK declaradas:

- fk_payments_order: (order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_payments_user_method: (user_payment_method_ID) → tbd_user_payment_methods(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_people

Motor: InnoDB; opciones: AUTO_INCREMENT=7503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: person_ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| person_ID | bigint unsigned | No | — | Sí | — | Sí |
| user_ID | int DEFAULT | Sí | — | — | fk_people_users | — |
| courtesy_title | varchar(20) DEFAULT | Sí | — | — | — | — |
| given_names | varchar(150) | No | — | — | — | — |
| family_names | varchar(150) DEFAULT | Sí | — | — | — | — |
| birth_date | date DEFAULT | Sí | — | — | — | — |
| gender | enum('Hombre','Mujer','Prefiero no decirlo') | No | 'Prefiero no decirlo' | — | — | — |
| country_code | char(2) DEFAULT | Sí | — | — | — | — |
| phone | varchar(25) DEFAULT | Sí | — | — | — | — |

Índices:

- user_ID: (user_ID) UNIQUE.

FK declaradas:

- fk_people_users: (user_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_product_categories

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: product_Id, category_Id.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| product_Id | int unsigned | No | — | Sí | fk_pc_product | — |
| category_Id | int unsigned | No | — | Sí | fk_pc_category | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |
| last_update | datetime | No | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | — | — | — |

Índices:

- idx_pc_category: (category_Id).

FK declaradas:

- fk_pc_category: (category_Id) → tb_categories(ID); ON DELETE CASCADE ON UPDATE CASCADE, ON UPDATE CASCADE.
- fk_pc_product: (product_Id) → tb_products(ID); ON DELETE CASCADE ON UPDATE CASCADE, ON UPDATE CASCADE.

### tb_products

Motor: InnoDB; opciones: AUTO_INCREMENT=8243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| SKU | varchar(50) | No | — | — | — | — |
| name | varchar(250) | No | — | — | — | — |
| current_price | decimal(10,2) | No | '0.00' | — | — | — |
| current_stock | int unsigned | No | '0' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |
| last_update | datetime | No | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | — | — | — |

Índices:

- SKU: (SKU) UNIQUE.

### tb_products_users_providers

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: user_ID, product_ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| user_ID | int | No | — | Sí | fk_products_users_providers_user | — |
| product_ID | int unsigned | No | — | Sí | fk_products_users_providers_product | — |
| type_ownership | enum('Owner','Reseller','Distributor') DEFAULT | Sí | — | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| available_date | datetime | No | — | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |
| last_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- idx_products_users_providers_product: (product_ID).

FK declaradas:

- fk_products_users_providers_product: (product_ID) → tb_products(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_products_users_providers_user: (user_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_refunds

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| payment_ID | int unsigned | No | — | — | fk_refunds_payment | — |
| amount | decimal(12,2) | No | — | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_refunds_payment: (payment_ID).

FK declaradas:

- fk_refunds_payment: (payment_ID) → tb_payments(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_returns

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| order_ID | int unsigned | No | — | — | fk_returns_order_hdr | — |
| requested_by | int | No | — | — | fk_returns_user | — |
| reason | text | No | — | — | — | — |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_returns_order_hdr: (order_ID).
- fk_returns_user: (requested_by).

FK declaradas:

- fk_returns_order_hdr: (order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_returns_user: (requested_by) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_shipments

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| order_ID | int unsigned | No | — | — | fk_shipments_order | — |
| tracking_number | varchar(100) DEFAULT | Sí | — | — | — | — |
| carrier | varchar(100) DEFAULT | Sí | — | — | — | — |
| shipping_status | enum('Preparing','In_Transit','Delivered','Failed') | No | 'Preparing' | — | — | — |
| shipped_date | datetime DEFAULT | Sí | — | — | — | — |
| delivered_date | datetime DEFAULT | Sí | — | — | — | — |

Índices:

- fk_shipments_order: (order_ID).

FK declaradas:

- fk_shipments_order: (order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tb_user

Motor: InnoDB; opciones: AUTO_INCREMENT=7531 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int | No | — | Sí | — | Sí |
| email | varchar(100) | No | — | — | — | — |
| nick | varchar(50) | No | — | — | — | — |
| password | varchar(255) | No | — | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |
| last_login | datetime DEFAULT | Sí | — | — | — | — |

Índices:

- email: (email) UNIQUE.
- nick: (nick) UNIQUE.

### tb_user_addresses

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — | Sí | — | Sí |
| user_ID | int | No | — | — | fk_addresses_users | — |
| address_label | varchar(100) | No | — | — | — | — |
| recipient_name | varchar(150) DEFAULT | Sí | — | — | — | — |
| recipient_phone | varchar(25) DEFAULT | Sí | — | — | — | — |
| delivery_instructions | varchar(500) DEFAULT | Sí | — | — | — | — |
| latitude | decimal(10,7) DEFAULT | Sí | — | — | — | — |
| longitude | decimal(10,7) DEFAULT | Sí | — | — | — | — |
| is_default | tinyint(1) | No | '0' | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- uq_tb_user_addresses_default_user: (default_user_ID) UNIQUE.
- idx_user_addresses: (user_ID).

FK declaradas:

- fk_addresses_users: (user_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tbc_payment_methods_types

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| name | varchar(50) | No | — | — | — | — |
| description | varchar(255) DEFAULT | Sí | — | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- Ninguno secundario explícito.

### tbd_address_components

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — | Sí | — | Sí |
| address_ID | bigint unsigned | No | — | — | fk_component_address, fk_component_parent | — |
| value | varchar(255) | No | — | — | — | — |
| component_type | varchar(50) | No | — | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| address_sup_ID | bigint unsigned DEFAULT | Sí | — | — | fk_component_parent | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- uk_address_component: (address_ID, ID) UNIQUE.
- idx_address_parent: (address_ID, address_sup_ID).

FK declaradas:

- fk_component_address: (address_ID) → tb_user_addresses(ID); ON DELETE RESTRICT, ON UPDATE no declarado.
- fk_component_parent: (address_ID, address_sup_ID) → tbd_address_components(address_ID, ID); ON DELETE RESTRICT, ON UPDATE no declarado.

### tbd_cancellation_items

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| cancellation_ID | int unsigned DEFAULT | Sí | — | — | fk_cancellation_items_header | — |
| order_ID | int unsigned | No | — | — | fk_cancellations_order | — |
| reason | text | No | — | — | — | — |
| requested_by | int | No | — | — | fk_cancellations_user | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_cancellations_order: (order_ID).
- fk_cancellations_user: (requested_by).
- fk_cancellation_items_header: (cancellation_ID).

FK declaradas:

- fk_cancellation_items_header: (cancellation_ID) → tb_order_cancellations(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_cancellations_order: (order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_cancellations_user: (requested_by) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tbd_cart_items

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: cart_ID, provider_ID, product_ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| cart_ID | int unsigned | No | — | Sí | fk_cart_items_cart | — |
| provider_ID | int | No | — | Sí | fk_cart_items_provider_product | — |
| product_ID | int unsigned | No | — | Sí | fk_cart_items_provider_product | — |
| quantity | int unsigned | No | '1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- idx_cart_items_provider_product: (provider_ID, product_ID).

FK declaradas:

- fk_cart_items_cart: (cart_ID) → tb_carts(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_cart_items_provider_product: (provider_ID, product_ID) → tb_products_users_providers(user_ID, product_ID); ON DELETE no declarado, ON UPDATE no declarado.

### tbd_order_items

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| seller_order_ID | int unsigned | No | — | — | tbd_order_items_ibfk_1 | — |
| product_ID | int unsigned | No | — | — | tbd_order_items_ibfk_2 | — |
| provider_ID | int | No | — | — | tbd_order_items_ibfk_2 | — |
| product_name | varchar(255) | No | — | — | — | — |
| quantity | int unsigned | No | — | — | — | — |
| unit_price | decimal(12,2) | No | — | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- seller_order_ID: (seller_order_ID).
- product_ID_provider_ID: (product_ID, provider_ID).

FK declaradas:

- tbd_order_items_ibfk_1: (seller_order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.
- tbd_order_items_ibfk_2: (product_ID, provider_ID) → tb_products_users_providers(product_ID, user_ID); ON DELETE no declarado, ON UPDATE no declarado.

### tbd_return_items

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | int unsigned | No | — | Sí | — | Sí |
| return_ID | int unsigned DEFAULT | Sí | — | — | fk_return_items_header | — |
| order_ID | int unsigned | No | — | — | fk_returns_order | — |
| reason | text | No | — | — | — | — |
| status | enum('Requested','Approved','Rejected','Completed') | No | 'Requested' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_returns_order: (order_ID).
- fk_return_items_header: (return_ID).

FK declaradas:

- fk_return_items_header: (return_ID) → tb_returns(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_returns_order: (order_ID) → tb_orders(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tbd_user_payment_methods

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| ID | bigint unsigned | No | — | Sí | — | Sí |
| user_ID | int | No | — | — | tbd_user_payment_methods_ibfk_1 | — |
| payment_method_type_ID | int unsigned | No | — | — | tbd_user_payment_methods_ibfk_2 | — |
| provider | varchar(60) | No | — | — | — | — |
| provider_method_ref | varchar(255) | No | — | — | — | — |
| label | varchar(100) DEFAULT | Sí | — | — | — | — |
| last_four | char(4) DEFAULT | Sí | — | — | — | — |
| is_default | tinyint(1) | No | '0' | — | — | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- uk_provider_method: (provider, provider_method_ref) UNIQUE.
- user_ID: (user_ID).
- payment_method_type_ID: (payment_method_type_ID).

FK declaradas:

- tbd_user_payment_methods_ibfk_1: (user_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.
- tbd_user_payment_methods_ibfk_2: (payment_method_type_ID) → tbc_payment_methods_types(ID); ON DELETE no declarado, ON UPDATE no declarado.

### tbd_users_wishlist_products

Motor: InnoDB; opciones: DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. PK: user_ID, product_ID.

| Columna | Tipo | NULL | Predeterminado | PK | FK | AUTO_INCREMENT |
|---|---|---|---|---|---|---|
| user_ID | int | No | — | Sí | fk_user2 | — |
| product_ID | int unsigned | No | — | Sí | fk_products3 | — |
| status | bit(1) | No | b'1' | — | — | — |
| creation_date | datetime | No | CURRENT_TIMESTAMP | — | — | — |

Índices:

- fk_products3: (product_ID).

FK declaradas:

- fk_products3: (product_ID) → tb_products(ID); ON DELETE no declarado, ON UPDATE no declarado.
- fk_user2: (user_ID) → tb_user(ID); ON DELETE no declarado, ON UPDATE no declarado.

## Relaciones declaradas

Cardinalidad reportada como 1:N desde el destino hacia las filas referenciadoras, salvo que la FK coincida con clave única, en cuyo caso se marca 1:1.

| Origen | Destino | Cardinalidad | Restricción |
|---|---|---|---|
| tb_carts.user_ID | tb_user.ID | 1:1 | tb_carts_ibfk_1 |
| tb_categories.sup_id_category | tb_categories.ID | 1:1 | fk_superior_category |
| tb_order_cancellations.order_ID | tb_orders.ID | 1:1 | fk_order_cancellations_order |
| tb_order_cancellations.requested_by | tb_user.ID | 1:1 | fk_order_cancellations_user |
| tb_orders.seller_ID | tb_user.ID | 1:1 | tb_orders_ibfk_1 |
| tb_payment_transaction.payment_ID | tb_payments.ID | 1:1 | fk_trans_payment |
| tb_payments.order_ID | tb_orders.ID | 1:1 | fk_payments_order |
| tb_payments.user_payment_method_ID | tbd_user_payment_methods.ID | 1:1 | fk_payments_user_method |
| tb_people.user_ID | tb_user.ID | 1:1 | fk_people_users |
| tb_product_categories.category_Id | tb_categories.ID | 1:1 | fk_pc_category |
| tb_product_categories.product_Id | tb_products.ID | 1:1 | fk_pc_product |
| tb_products_users_providers.product_ID | tb_products.ID | 1:1 | fk_products_users_providers_product |
| tb_products_users_providers.user_ID | tb_user.ID | 1:1 | fk_products_users_providers_user |
| tb_refunds.payment_ID | tb_payments.ID | 1:1 | fk_refunds_payment |
| tb_returns.order_ID | tb_orders.ID | 1:1 | fk_returns_order_hdr |
| tb_returns.requested_by | tb_user.ID | 1:1 | fk_returns_user |
| tb_shipments.order_ID | tb_orders.ID | 1:1 | fk_shipments_order |
| tb_user_addresses.user_ID | tb_user.ID | 1:1 | fk_addresses_users |
| tbd_address_components.address_ID | tb_user_addresses.ID | 1:1 | fk_component_address |
| tbd_address_components.address_ID,address_sup_ID | tbd_address_components.address_ID,ID | 1:1 | fk_component_parent |
| tbd_cancellation_items.cancellation_ID | tb_order_cancellations.ID | 1:1 | fk_cancellation_items_header |
| tbd_cancellation_items.order_ID | tb_orders.ID | 1:1 | fk_cancellations_order |
| tbd_cancellation_items.requested_by | tb_user.ID | 1:1 | fk_cancellations_user |
| tbd_cart_items.cart_ID | tb_carts.ID | 1:1 | fk_cart_items_cart |
| tbd_cart_items.provider_ID,product_ID | tb_products_users_providers.user_ID,product_ID | 1:1 | fk_cart_items_provider_product |
| tbd_order_items.seller_order_ID | tb_orders.ID | 1:1 | tbd_order_items_ibfk_1 |
| tbd_order_items.product_ID,provider_ID | tb_products_users_providers.product_ID,user_ID | 1:1 | tbd_order_items_ibfk_2 |
| tbd_return_items.return_ID | tb_returns.ID | 1:1 | fk_return_items_header |
| tbd_return_items.order_ID | tb_orders.ID | 1:1 | fk_returns_order |
| tbd_user_payment_methods.user_ID | tb_user.ID | 1:1 | tbd_user_payment_methods_ibfk_1 |
| tbd_user_payment_methods.payment_method_type_ID | tbc_payment_methods_types.ID | 1:1 | tbd_user_payment_methods_ibfk_2 |
| tbd_users_wishlist_products.product_ID | tb_products.ID | 1:1 | fk_products3 |
| tbd_users_wishlist_products.user_ID | tb_user.ID | 1:1 | fk_user2 |

## Vistas y rutinas

### Vistas (29)

- **vw_address_hierarchical_details** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_people_details** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_total_products_by_category** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_carts** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_categories** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_order_cancellations** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_orders** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_payment_methods** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_payment_transaction** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_payments** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_people** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_product_categories** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_products** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_products_users_providers** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_refunds** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_returns** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_shipments** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_user** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tb_user_addresses** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbc_payment_methods_types** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_address_components** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_cancellation_items** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_cart_items** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_order_items** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_return_items** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_user_payment_methods** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_trazabilidad_tbd_users_wishlist_products** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_user_default_shipping_addresses** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.
- **vw_wishlist_carritos** — definición SQL incluida en el respaldo; no se añade interpretación funcional no explícita.

### Procedimientos almacenados

- **sp_register_new_user**(IN p_email VARCHAR(100) — rutina definida en el respaldo.
- **sp_restore_product**(IN p_product_id INT UNSIGNED) — rutina definida en el respaldo.
- **sp_soft_delete_product**(IN p_product_id INT UNSIGNED) — rutina definida en el respaldo.

Funciones: 0. Triggers: 0.

## Alcance y limitaciones

Solo se consideró el respaldo indicado. No se ejecutó SQL ni se consultó servidor. Solo se documentan relaciones explícitas mediante FOREIGN KEY; no se infieren vínculos por nombres. La cardinalidad refleja unicidad declarada, sin inferir obligatoriedad de participación. Descripciones funcionales se limitan a nombres y definiciones presentes en SQL.
