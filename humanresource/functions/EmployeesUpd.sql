CREATE OR REPLACE FUNCTION humanresource.employeesupd(_src JSONB, _staff_id INT) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
AS
$$
DECLARE
    _employee_id  BIGINT;
    _phone_number VARCHAR(11);
    _name         VARCHAR(64);
    _birth_date   DATE;
    _dt           TIMESTAMPTZ := now() AT TIME ZONE 'Europe/Moscow';
BEGIN
    SELECT COALESCE(e.employee_id, nextval('humanresource.employeesq')) as employee_id,
           s.phone_number,
           s.name,
           s.birth_date
    INTO _employee_id, _phone_number, _name, _birth_date
    FROM jsonb_to_record(_src) AS s (employee_id  BIGINT,
                                     phone_number VARCHAR(11),
                                     name         VARCHAR(64),
                                     birth_date   DATE)
             LEFT JOIN humanresource.employees e
                       ON e.employee_id = s.employee_id;

    WITH ins_cte AS (
        INSERT INTO humanresource.employees AS e (employee_id,
                                                  phone_number,
                                                  name,
                                                  birth_date,
                                                  staff_id,
                                                  ch_dt)
            SELECT _employee_id,
                   _phone_number,
                   _name,
                   _birth_date,
                   _staff_id,
                   _dt
            ON CONFLICT (employee_id) DO UPDATE
                SET phone_number = excluded.phone_number,
                    name         = excluded.name,
                    birth_date   = excluded.birth_date,
                    staff_id     = excluded.staff_id,
                    ch_dt        = excluded.ch_dt
            RETURNING e.*)

       , ins_his AS (
        INSERT INTO history.employeeschanges AS ec (employee_id,
                                                    phone_number,
                                                    name,
                                                    birth_date,
                                                    staff_id,
                                                    ch_dt)
            SELECT ic.employee_id,
                   ic.phone_number,
                   ic.name,
                   ic.birth_date,
                   ic.staff_id,
                   ic.ch_dt
            FROM ins_cte ic)

    INSERT INTO whsync.employeessync (employee_id,
                                      phone_number,
                                      name,
                                      birth_date,
                                      staff_id,
                                      ch_dt)
    SELECT ic.employee_id,
           ic.phone_number,
           ic.name,
           ic.birth_date,
           ic.staff_id,
           ic.ch_dt
    FROM ins_cte ic;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;
