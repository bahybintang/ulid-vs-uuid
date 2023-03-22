\c rpl
CREATE OR REPLACE FUNCTION update_random_ulid()
RETURNS void AS $$
DECLARE
    row_data record;
    new_age INTEGER;
BEGIN
    FOR row_data IN SELECT * FROM ulid_testing ORDER BY random() LIMIT 10000 LOOP
        new_age := 18 + random() * (65 - 18 + 1);
        UPDATE ulid_testing SET age = new_age WHERE ulid = row_data.ulid;
    END LOOP;
END;
$$ LANGUAGE plpgsql;