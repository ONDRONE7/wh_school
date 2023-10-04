CREATE TABLE IF NOT EXISTS cinema.rooms
(
    room_id  INT         NOT NULL,
    type_id  SMALLINT    NOT NULL,
    staff_id INT         NULL,
    ch_dt    TIMESTAMPTZ NOT NULL,
    CONSTRAINT pk_rooms PRIMARY KEY (room_id, staff_id)
);