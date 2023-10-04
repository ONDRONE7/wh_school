CREATE TABLE IF NOT EXISTS humanresource.employeescard
(
    card_id     BIGINT      NOT NULL
        CONSTRAINT pk_employeescard PRIMARY KEY,
    employee_id BIGINT      NOT NULL,
    level       SMALLINT    NOT NULL,
    staff_id    INT         NOT NULL,
    ch_dt       TIMESTAMPTZ NOT NULL,
    CONSTRAINT uq_employeescard_emp_card UNIQUE (employee_id, card_id)
);