\c rpl
CREATE OR REPLACE FUNCTION find_random_ulid()
RETURNS void AS $$
DECLARE
    row_data record;
BEGIN
    FOR row_data IN SELECT * FROM ulid_testing ORDER BY random() LIMIT 100000 LOOP
        PERFORM 'SELECT * FROM ulid_testing WHERE ulid = row_data.ulid';
    END LOOP;
END;
$$ LANGUAGE plpgsql;