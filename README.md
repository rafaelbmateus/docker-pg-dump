# Docker Postgres Dump

Create a `.env`:

```
POSTGRES_HOST=localhost
POSTGRES_USER=user
POSTGRES_PASSWORD=s3cr3t
POSTGRES_DB=database_name
SLACK_WEBHOOK_URL=<YOUR_SLACK_WEBHOOK_URL>
```

Checking connection:

```console
make check
```

Creating database dump:

```console
make dump
```

Open bash:

```console
make bash
psql -U root -d dump
```

# Running docker image

```console
docker run \
  -e POSTGRES_HOST=localhost \
  -e POSTGRES_USER=user \
  -e POSTGRES_PASSWORD=s3cr3t \
  -e POSTGRES_DB=database_name \
  -e SLACK_WEBHOOK_URL=<YOUR_SLACK_WEBHOOK_URL>
  -v $(pwd)/db/postgres:/var/lib/postgresql/data \
  -v $(pwd)/db/dumps:/dumps \
  rafaelbmateus/docker-pg-dump:latest run-daily.sh
```

# Running in docker compose

```yml
  pg-dump:
    image: rafaelbmateus/docker-pg-dump:latest
    environment:
      POSTGRES_HOST: db
      POSTGRES_USER: user
      POSTGRES_PASSWORD: s3cr3t
      POSTGRES_DB: database_name
      SLACK_WEBHOOK_URL: https://hooks.slack.com/services/AAAAAAAAAAA/BBBBBBBBBBB/CCCCCCCCCCCCCCCCCCCCCCCC
    command: run-daily.sh
    volumes:
      - ../db/postgres:/var/lib/postgresql/data
      - ../db/dumps/:/dumps/
    depends_on:
      - db
```
