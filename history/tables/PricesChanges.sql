CREATE TABLE IF NOT EXISTS history.priceschanges
(
    log_id   BIGSERIAL     NOT NULL
        CONSTRAINT pk_priceschanges PRIMARY KEY,
    goods_id INT           NOT NULL,
    sku_id   INT           NOT NULL,
    price    NUMERIC(8, 2) NOT NULL,
    staff_id INT           NOT NULL,
    ch_dt    TIMESTAMPTZ   NOT NULL
);