\c rpl
\timing on
SELECT * FROM uuid_join_testing 
INNER JOIN uuid_testing ON uuid_join_testing.uuid = uuid_testing.uuid;