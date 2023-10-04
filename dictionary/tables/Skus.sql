CREATE TABLE IF NOT EXISTS dictionary.skus
(
    sku_id   INT         NOT NULL
        CONSTRAINT pk_skus PRIMARY KEY,
    sku_type CHAR(4)     NOT NULL,
    name     VARCHAR(32) NOT NULL
);