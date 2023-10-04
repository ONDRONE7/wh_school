CREATE TABLE IF NOT EXISTS cinema.sessions
(
    goods_id  INT         NOT NULL,
    sku_id    INT         NOT NULL,
    room_id   SMALLINT    NOT NULL,
    is_actual BOOLEAN     NOT NULL,
    staff_id  INT         NULL,
    ch_dt     TIMESTAMPTZ NOT NULL,
    CONSTRAINT uq_sessions_goods_sku_room UNIQUE (goods_id, sku_id, room_id)
);