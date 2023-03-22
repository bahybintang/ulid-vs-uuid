\c rpl
CREATE OR REPLACE FUNCTION loop_and_insert_uuid()
RETURNS void AS $$
DECLARE
  row record;
BEGIN
  FOR row IN SELECT uuid FROM uuid_testing LOOP
    INSERT INTO uuid_join_testing (uuid, address, salary)
    VALUES (row.uuid, md5(random()::text), floor(random() * (10000000 - 1 + 1)) + 1)
    ON CONFLICT (uuid) DO NOTHING;
  END LOOP;
END;
$$ LANGUAGE plpgsql;