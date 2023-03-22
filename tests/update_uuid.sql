\c rpl
CREATE OR REPLACE FUNCTION update_random_uuid()
RETURNS void AS $$
DECLARE
    row_data record;
    new_age INTEGER;
BEGIN
    FOR row_data IN SELECT * FROM uuid_testing ORDER BY random() LIMIT 100000 LOOP
        new_age := 18 + random() * (65 - 18 + 1);
        UPDATE uuid_testing SET age = new_age WHERE uuid = row_data.uuid;
    END LOOP;
END;
$$ LANGUAGE plpgsql;