up:
	docker-compose --compatibility up -d

init:
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i pgulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i init.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_ulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_uuid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_ulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_uuid.sql"

# Test every one million data
test:
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_ulid_test.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/insert_uuid_test.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_ulid_test.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i tests/find_uuid_test.sql"