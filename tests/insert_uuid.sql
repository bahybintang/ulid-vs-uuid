\c rpl
CREATE OR REPLACE FUNCTION insert_random_uuid_data()
RETURNS VOID AS $$
DECLARE
    first_names CONSTANT TEXT[] := '{"Alice", "Bob", "Charlie", "Dave", "Eve"}';
    last_names CONSTANT TEXT[] := '{"Smith", "Johnson", "Williams", "Jones", "Brown"}';
    min_age CONSTANT INT := 18;
    max_age CONSTANT INT := 65;
BEGIN
    INSERT INTO uuid_testing (first_name, last_name, age)
    VALUES (
        first_names[1 + random() * (array_length(first_names, 1) - 1)],
        last_names[1 + random() * (array_length(last_names, 1) - 1)],
        min_age + random() * (max_age - min_age + 1)
    );
END;
$$ LANGUAGE plpgsql;