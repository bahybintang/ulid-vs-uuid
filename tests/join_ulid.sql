\c rpl
CREATE OR REPLACE FUNCTION loop_and_insert_ulid()
RETURNS void AS $$
DECLARE
  row record;
BEGIN
  FOR row IN SELECT ulid FROM ulid_testing LOOP
    INSERT INTO ulid_join_testing (ulid, address, salary)
    VALUES (row.ulid, md5(random()::text), floor(random() * (10000000 - 1 + 1)) + 1)
    ON CONFLICT (ulid) DO NOTHING;
  END LOOP;
END;
$$ LANGUAGE plpgsql;