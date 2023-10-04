CREATE TABLE IF NOT EXISTS history.employeescardchanges
(
    log_id      BIGSERIAL   NOT NULL
        CONSTRAINT pk_employeescardchanges PRIMARY KEY,
    card_id     BIGINT      NOT NULL,
    employee_id BIGINT      NOT NULL,
    level       SMALLINT    NOT NULL,
    staff_id    INT         NOT NULL,
    ch_dt       TIMESTAMPTZ NOT NULL
);