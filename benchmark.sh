#!/usr/bin/env bash

for i in {1..10}; do
    echo "Running benchmark $i million"
    echo "epoch,ulid_insert,uuid_insert,ulid_find,uuid_find,ulid_update,uuid_update,ulid_join,uuid_join" >> "results/benchmark_${i}million.csv"
    ulid_insert=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_ulid_test.sql" | grep "Execution Time:" | awk '{print $3}')
    uuid_insert=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_uuid_test.sql" | grep "Execution Time:" | awk '{print $3}')
    PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/join_ulid_init.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/join_uuid_init.sql"
    for j in {1..10}; do
        echo "Running benchmark $i million: epoch $j"
        ulid_find=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_ulid_test.sql" | grep "Execution Time:" | awk '{print $3}')
        uuid_find=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_uuid_test.sql" | grep "Execution Time:" | awk '{print $3}')
        ulid_update=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/update_ulid_test.sql" | grep "Execution Time:" | awk '{print $3}')
        uuid_update=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/update_uuid_test.sql" | grep "Execution Time:" | awk '{print $3}')
        ulid_join=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/join_ulid_test.sql" | grep "Execution Time:" | awk '{print $3}')
        uuid_join=$(PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/join_uuid_test.sql" | grep "Execution Time:" | awk '{print $3}')
        echo "$j,$ulid_insert,$uuid_insert,$ulid_find,$uuid_find,$ulid_update,$uuid_update,$ulid_join,$uuid_join" >> "results/benchmark_${i}million.csv"
    done
done