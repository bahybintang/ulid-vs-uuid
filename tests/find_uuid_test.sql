\c rpl
\timing on
SELECT * FROM find_random_uuid(ARRAY(SELECT uuid FROM uuid_testing TABLESAMPLE BERNOULLI(1000000/(SELECT COUNT(*) FROM uuid_testing))));
