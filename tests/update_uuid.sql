\c rpl
CREATE OR REPLACE FUNCTION update_random_uuid(uuids TEXT[])
RETURNS void AS $$
DECLARE
    query text;
    new_age INTEGER;
BEGIN
    FOREACH query IN ARRAY uuids LOOP
        new_age := 18 + random() * (65 - 18 + 1);
        UPDATE uuid_testing SET age = new_age WHERE uuid = query;
    END LOOP;
END;
$$ LANGUAGE plpgsql;