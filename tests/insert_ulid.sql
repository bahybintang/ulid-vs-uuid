\c rpl
CREATE OR REPLACE FUNCTION insert_random_ulid_data()
RETURNS VOID AS $$
DECLARE
    first_names CONSTANT TEXT[] := '{"Alice", "Bob", "Charlie", "Dave", "Eve"}';
    last_names CONSTANT TEXT[] := '{"Smith", "Johnson", "Williams", "Jones", "Brown"}';
    min_age CONSTANT INT := 18;
    max_age CONSTANT INT := 65;
BEGIN
    INSERT INTO ulid_testing (first_name, last_name, age)
    VALUES (
        first_names[1 + random() * (array_length(first_names, 1) - 1)],
        last_names[1 + random() * (array_length(last_names, 1) - 1)],
        min_age + random() * (max_age - min_age + 1)
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_random_ulid_data_test()
RETURNS VOID AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    total_time INTERVAL;
    iterations INT := 10000;
BEGIN
    start_time := clock_timestamp();
    FOR i IN 1..iterations LOOP
        PERFORM insert_random_ulid_data();
    END LOOP;
    end_time := clock_timestamp();
    total_time := end_time - start_time;
    RAISE NOTICE 'Execution Time: %', total_time;
END;
$$ LANGUAGE plpgsql;