\c rpl
EXPLAIN ANALYZE SELECT * FROM ulid_join_testing 
INNER JOIN ulid_testing ON ulid_join_testing.ulid = ulid_testing.ulid;