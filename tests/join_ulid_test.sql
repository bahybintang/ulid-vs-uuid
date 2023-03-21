\c rpl
SELECT loop_and_insert_ulid();

EXPLAIN ANALYZE SELECT * FROM ulid_join_testing 
INNER JOIN ulid_testing ON ulid_join_testing.ulid = ulid_testing.ulid;