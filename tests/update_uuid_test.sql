\c rpl
\timing on
SELECT update_random_uuid(ARRAY(SELECT uuid FROM uuid_testing TABLESAMPLE BERNOULLI(100000/(SELECT COUNT(*) FROM uuid_testing))));