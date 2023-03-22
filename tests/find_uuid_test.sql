\c rpl
DO $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    total_time INTERVAL;
    iterations INT := 1000000;
BEGIN
    start_time := clock_timestamp();
    FOR i IN 1..iterations LOOP
        PERFORM find_random_uuid_data();
    END LOOP;
    end_time := clock_timestamp();
    total_time := end_time - start_time;
    RAISE NOTICE 'Execution Time: %', total_time;
END;
$$;