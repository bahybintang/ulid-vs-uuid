\c rpl
CREATE OR REPLACE FUNCTION find_random_uuid_data()
RETURNS TEXT[] AS $$
DECLARE
    search TEXT := uuid_generate_v4();
    uuid_result INT;
BEGIN
    SELECT uuid INTO uuid_result FROM uuid_testing WHERE uuid = search LIMIT 1;
    RETURN uuid_result;
END;
$$ LANGUAGE plpgsql;