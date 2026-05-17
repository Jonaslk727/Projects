# Dockerized SQL Server Test Database

This project runs Microsoft SQL Server in Docker and initializes a shared test database schema + mock data that every teammate can run locally.

## What it creates
- SQL Server 2022 container
- Database: `ImageDatabase`
- Schema from `init/init.sql`
- Seed data from `init/mockData.sql`

## Prerequisites
- Docker Desktop (or Docker Engine + Compose)

## First-time setup
1. Create `.env` from the example:
   - PowerShell:
     ```powershell
     Copy-Item .env.example .env
     ```
2. Edit `.env` and set `MSSQL_SA_PASSWORD`.

## Start database
```powershell
docker compose up -d --build
```

## Check health
```powershell
docker compose ps
```
The `sqlserver` service should show as healthy.

## Connect from local apps
- Host: `localhost`
- Port: `1433`
- User: `sa`
- Password: value from `.env`
- Database: `ImageDatabase`

## Reset to clean state
If you want to recreate schema and seed data from scratch:
```powershell
docker compose down -v
docker compose up -d --build
```

## Useful commands
- View logs:
  ```powershell
  docker compose logs -f sqlserver
  ```
- Stop container:
  ```powershell
  docker compose down
  ```

## Notes
- Database files are persisted in a Docker volume (`sql_data`).
- Initialization runs on container startup via `init/entrypoint.sh`.
