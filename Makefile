up:
	docker-compose --compatibility up -d

init:
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i pgulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i init.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_ulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_uuid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_ulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_uuid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/update_ulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/update_uuid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/join_ulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/join_uuid.sql"

test:
	./benchmark.sh

reset:
	PGPASSWORD=postgres psql -U postgres -h localhost -d rpl -c "drop table ulid_testing;"
	PGPASSWORD=postgres psql -U postgres -h localhost -d rpl -c "drop table uuid_testing;"
	PGPASSWORD=postgres psql -U postgres -h localhost -d rpl -c "drop table uuid_join_testing;"
	PGPASSWORD=postgres psql -U postgres -h localhost -d rpl -c "drop table ulid_join_testing;"