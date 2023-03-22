\c rpl
CREATE OR REPLACE FUNCTION find_random_uuid()
RETURNS void AS $$
DECLARE
    row_data record;
BEGIN
    FOR row_data IN SELECT * FROM uuid_testing ORDER BY random() LIMIT 100000 LOOP
        PERFORM 'SELECT * FROM uuid_testing WHERE uuid = row_data.uuid';
    END LOOP;
END;
$$ LANGUAGE plpgsql;