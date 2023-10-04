CREATE TABLE IF NOT EXISTS dictionary.moviestypes
(
    type_id  SMALLSERIAL NOT NULL
        CONSTRAINT pk_moviestypes PRIMARY KEY,
    name     VARCHAR(32) NOT NULL,
    staff_id INT         NOT NULL,
    ch_dt    TIMESTAMPTZ NOT NULL
);