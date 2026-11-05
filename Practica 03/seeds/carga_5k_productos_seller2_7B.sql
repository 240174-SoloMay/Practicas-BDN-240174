LOAD DATA LOCAL INFILE 'C:/Users/maria/OneDrive/Escritorio/Practicas-BDN-240174/seeds/productos_SoloMay_5000.csv'
INTO TABLE tb_products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    ID,
    SKU,
    name,
    description,
    current_price,
    current_stock,
    @status
)
SET
    status = IF(@status = 1, b'1', b'0'),
    creation_date = CURRENT_TIMESTAMP,
    last_update = CURRENT_TIMESTAMP;