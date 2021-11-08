# epoc-db
epoc mock postgresql db with seed data

## run locally
```bash
docker run --rm -p 5432:5432 ghcr.io/three-consulting/epoc-db:latest
```

## edit schema or data

In case of new migrations, a plain postgresql db should be run with the new epoc application. The migrations for this mock db can be generated by
```bash
docker exec epoc_postgres_1 pg_dump -U user -d epoc -O -x > db.sql
```

When editing only data, edit `data.sql` by hand.
