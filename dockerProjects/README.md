# Dockerized SQL Server Test Database

This project runs Microsoft SQL Server in Docker and initializes a shared test database schema + mock data that every teammate can run locally.

Run the commands below from `DockerDb3semProj`.

## What it creates
- SQL Server 2022 container
- Database: `ImageDatabase`
- Schema from `init/init.sql`
- Seed data from `init/mockData.sql`

## Prerequisites
- Docker Desktop (or Docker Engine + Compose)

## First-time setup
1. Create a `.env` file from the example:
   - PowerShell:
     ```powershell
     Copy-Item Example.txt .env
     ```
   - Linux or WSL:
     ```bash
     cp Example.txt .env
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
- Host/ server name: `localhost`
- Port: `1433`
- User: `sa`
- Password: value from `.env`
- Database: `ImageDatabase`

- Choose SQL Server authentication.
- Trust the server certificate if your client prompts for it.

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
