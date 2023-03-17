up:
	docker-compose --compatibility up -d

init:
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i pgulid.sql"
	PGPASSWORD=postgres psql -U postgres -h localhost -c "\i init.sql"