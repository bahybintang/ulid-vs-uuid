\c rpl
\timing on
SELECT find_random_ulid(ARRAY(SELECT ulid FROM ulid_testing TABLESAMPLE BERNOULLI(100000/(SELECT COUNT(*) FROM ulid_testing))));