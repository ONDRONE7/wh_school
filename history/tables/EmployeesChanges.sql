CREATE TABLE IF NOT EXISTS history.employeeschanges
(
    log_id       BIGSERIAL   NOT NULL
        CONSTRAINT pk_employeeschanges PRIMARY KEY,
    employee_id  BIGINT      NOT NULL,
    phone_number VARCHAR(11) NOT NULL,
    name         VARCHAR(64) NOT NULL,
    birth_date   DATE        NOT NULL,
    staff_id     INT         NOT NULL,
    ch_dt        TIMESTAMPTZ NOT NULL
);