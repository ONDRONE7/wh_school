CREATE TABLE IF NOT EXISTS public.cinemainfo
(
    setting_id SMALLSERIAL  NOT NULL
        CONSTRAINT pk_cinemainfo PRIMARY KEY,
    name       VARCHAR(32)  NOT NULL,
    value      VARCHAR(500) NULL
);