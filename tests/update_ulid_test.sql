\c rpl
\timing on
SELECT update_random_ulid(ARRAY(SELECT ulid FROM ulid_testing TABLESAMPLE BERNOULLI(1000000/(SELECT COUNT(*) FROM ulid_testing))));