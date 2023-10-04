CREATE TABLE IF NOT EXISTS dictionary.roomstypes
(
    type_id SMALLSERIAL NOT NULL
        CONSTRAINT pk_roomstypes PRIMARY KEY,
    street  SMALLINT    NOT NULL,
    name    VARCHAR(64) NOT NULL
);