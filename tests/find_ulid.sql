\c rpl
CREATE OR REPLACE FUNCTION find_random_ulid(ulids TEXT[])
RETURNS void AS $$
DECLARE
    query TEXT;
BEGIN
    FOREACH query IN ARRAY ulids LOOP
        PERFORM FORMAT('SELECT * FROM ulid_testing WHERE ulid = %s', query);
    END LOOP;
END;
$$ LANGUAGE plpgsql;