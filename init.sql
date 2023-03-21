\c rpl 
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE uuid_testing (
    uuid TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER
);

CREATE TABLE ulid_testing (
    ulid TEXT PRIMARY KEY DEFAULT generate_ulid(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER
);

CREATE TABLE uuid_join_testing (
    uuid TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    address TEXT NOT NULL,
    salary INTEGER
);

CREATE TABLE ulid_join_testing (
    ulid TEXT PRIMARY KEY DEFAULT generate_ulid(),
    address TEXT NOT NULL,
    salary INTEGER
);