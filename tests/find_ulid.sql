\c rpl
CREATE OR REPLACE FUNCTION find_random_ulid_data()
RETURNS TEXT[] AS $$
DECLARE
    search TEXT := generate_ulid();
    ulid_result INT;
BEGIN
    SELECT ulid INTO ulid_result FROM ulid_testing WHERE ulid = search LIMIT 1;
    RETURN ulid_result;
END;
$$ LANGUAGE plpgsql;