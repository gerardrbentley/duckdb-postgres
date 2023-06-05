# CTE vs Subqueries: Who gives a 🦆uck

## Setup Commands

```sh
# spin up postgres in background
docker-compose up --build -d
# run postgres database init and data generation
docker-compose exec database psql --username demo_user --dbname demo -f /tmp/pg/init_db.sql

# MISC
# wipe postgres container
docker-compose down --volumes --remove-orphans
# follow logs
docker-compose logs -f
# rebuild duck image
docker-compose build duck-database

# bash in postgres container
docker-compose exec database bash
# bash in duckdb container
docker-compose run duck-database -i
```

## Query Commands

```sh
docker-compose exec database psql --username demo_user --dbname demo -f /tmp/pg/subquery.sql
docker-compose exec database psql --username demo_user --dbname demo -f /tmp/pg/cte.sql

docker-compose run --build duck-database entrypoint.sh duckdb -c ".read pg/subquery.sql"
docker-compose run --build duck-database entrypoint.sh duckdb -c ".read pg/cte.sql"

docker-compose run --build duck-database entrypoint.sh duckdb duck/students.db -c ".read pg/init_db_scan_cache.sql"
docker-compose run --build duck-database entrypoint.sh duckdb duck/students.db -c ".read pg/cte_cached.sql"
docker-compose run --build duck-database entrypoint.sh duckdb duck/students.db -c ".read pg/subquery_cached.sql"

# psql cli in postgres container
docker-compose exec database psql --username demo_user --dbname demo

# duckdb cli in duckdb container
docker-compose run --build duck-database entrypoint.sh duckdb duck/students.db
```
