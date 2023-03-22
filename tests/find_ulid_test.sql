\c rpl
\timing on
SELECT find_random_ulid(ARRAY(SELECT uuid FROM uuid_testing TABLESAMPLE BERNOULLI(100000/(SELECT COUNT(*) FROM uuid_testing))));