\c rpl
SELECT loop_and_insert_uuid();

EXPLAIN ANALYZE SELECT * FROM uuid_join_testing 
INNER JOIN uuid_testing ON uuid_join_testing.uuid = uuid_testing.uuid;