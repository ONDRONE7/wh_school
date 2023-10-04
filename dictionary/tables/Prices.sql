CREATE TABLE IF NOT EXISTS dictionary.prices
(
    goods_id INT           NOT NULL
        CONSTRAINT pk_prices PRIMARY KEY,
    sku_id   INT           NOT NULL,
    price    NUMERIC(8, 2) NOT NULL,
    staff_id INT           NOT NULL,
    ch_dt    TIMESTAMPTZ   NOT NULL,
    CONSTRAINT uq_prices_goods_sku UNIQUE (goods_id, sku_id)
);