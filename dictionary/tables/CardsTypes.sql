CREATE TABLE IF NOT EXISTS dictionary.cardstypes
(
    type_id  SMALLSERIAL NOT NULL
        CONSTRAINT pk_cardstypes PRIMARY KEY,
    name     VARCHAR(16) NOT NULL,
    discount SMALLINT    NOT NULL
);