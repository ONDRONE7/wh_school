CREATE TABLE IF NOT EXISTS dictionary.movies
(
    movie_id   INT          NOT NULL
        CONSTRAINT pk_movies PRIMARY KEY,
    name       VARCHAR(128) NOT NULL,
    movie_desc JSON         NOT NULL,
    is_actual  BOOLEAN      NOT NULL,
    staff_id   INT          NOT NULL,
    ch_dt      TIMESTAMPTZ  NOT NULL
);

