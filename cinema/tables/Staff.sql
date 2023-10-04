CREATE TABLE IF NOT EXISTS cinema.staff
(
    staff_id INT          NOT NULL,
    name     VARCHAR(500) NOT NULL,
    room_id  SMALLINT     NULL,
    grant_id SMALLINT     NOT NULL
);