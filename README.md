# Docker Postgres Dump

Check connections:

```console
make check
```

```console
make dump
```

Create a `.env`:

```
POSTGRES_USER=root
POSTGRES_PASSWORD=123456
POSTGRES_DB=dump
SLACK_WEBHOOK_URL=<YOUR_SLACK_WEBHOOK_URL>
```

Open bash:

```console
make bash
psql -U root -d dump
```
