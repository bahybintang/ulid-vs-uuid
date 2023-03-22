\c rpl
\timing on
SELECT update_random_ulid(ARRAY(SELECT ulid FROM ulid_testing TABLESAMPLE BERNOULLI(100000/(SELECT COUNT(*) FROM ulid_testing))));