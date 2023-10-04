CREATE TABLE IF NOT EXISTS cinema.sales
(
    sale_id     BIGINT   NOT NULL
        CONSTRAINT pk_sales PRIMARY KEY,
    goods_id    INT      NOT NULL,
    sku_id      INT      NOT NULL,
    quantity    SMALLINT NOT NULL,
    employee_id BIGINT   NOT NULL,
    staff_id    INT      NULL
);