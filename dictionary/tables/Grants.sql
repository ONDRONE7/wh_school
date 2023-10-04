CREATE TABLE IF NOT EXISTS dictionary.grants
(
    grant_id    SMALLSERIAL    NOT NULL
        CONSTRAINT pk_grants PRIMARY KEY,
    name        VARCHAR(64)    NOT NULL,
    schedule_id SMALLINT       NOT NULL,
    salary      NUMERIC(15, 2) NULL
);