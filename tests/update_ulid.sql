\c rpl
CREATE OR REPLACE FUNCTION update_random_ulid(ulids TEXT[])
RETURNS void AS $$
DECLARE
    query text;
    new_age INTEGER;
BEGIN
    FOREACH query IN ARRAY ulids LOOP
        new_age := 18 + random() * (65 - 18 + 1);
        UPDATE ulid_testing SET age = new_age WHERE ulid = query;
    END LOOP;
END;
$$ LANGUAGE plpgsql;