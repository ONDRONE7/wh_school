CREATE OR REPLACE FUNCTION whsync.employeessyncimport(_src JSONB) RETURNS JSONB
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
BEGIN
    INSERT INTO humanresource.employees AS e (employee_id,
                                              phone_number,
                                              name,
                                              birth_date,
                                              staff_id,
                                              ch_dt)
    SELECT s.employee_id,
           s.phone_number,
           s.name,
           s.birth_date,
           s.staff_id,
           s.ch_dt
    FROM jsonb_to_recordset(_src) AS s (employee_id BIGINT,
                                        phone_number VARCHAR(11),
                                        name VARCHAR(64),
                                        birth_date DATE,
                                        staff_id INT,
                                        ch_dt TIMESTAMPTZ)
    ON CONFLICT (employee_id) DO UPDATE
        SET phone_number = excluded.phone_number,
            name         = excluded.name,
            birth_date   = excluded.birth_date,
            staff_id     = excluded.staff_id,
            ch_dt        = excluded.ch_dt
    WHERE e.ch_dt < excluded.ch_dt;

    RETURN JSONB_BUILD_OBJECT('data',NULL);
END
$$;
