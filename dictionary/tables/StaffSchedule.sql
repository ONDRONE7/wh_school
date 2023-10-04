CREATE TABLE IF NOT EXISTS dictionary.staffschedule
(
    schedule_id SMALLSERIAL NOT NULL
        CONSTRAINT pk_schedules PRIMARY KEY,
    name        VARCHAR(32) NOT NULL
);