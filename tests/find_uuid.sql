\c rpl
CREATE OR REPLACE FUNCTION find_random_uuid(uuids TEXT[])
RETURNS void AS $$
DECLARE
    query TEXT;
BEGIN
    FOREACH query IN ARRAY uuids LOOP
        PERFORM FORMAT('SELECT * FROM uuid_testing WHERE uuid = %s', query);
    END LOOP;
END;
$$ LANGUAGE plpgsql;