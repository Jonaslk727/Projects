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
- PowerShell:
  ```powershell
  docker compose up -d --build
  ```
- Bash (Linux/macOS/WSL):
  ```bash
  docker compose up -d --build
  ```

## Check health
- PowerShell:
  ```powershell
  docker compose ps
  ```
- Bash (Linux/macOS/WSL):
  ```bash
  docker compose ps
  ```
The `sqlserver` service should show as healthy.

## Connect from local apps
- Host: `localhost`
- Port: `1433`
- Server name: `localhost, 1433`
- User: `sa`
- Password: value from `.env`
- Database: `ImageDatabase`

- Choose SQL Server authentication.
- Trust the server certificate if your client prompts for it.

## Reset to clean state
If you want to recreate schema and seed data from scratch:
- PowerShell:
  ```powershell
  docker compose down -v
  docker compose up -d --build
  ```
- Bash (Linux/macOS/WSL):
  ```bash
  docker compose down -v
  docker compose up -d --build
  ```

## Useful commands
- View logs:
  - PowerShell:
    ```powershell
    docker compose logs -f sqlserver
    ```
  - Bash (Linux/macOS/WSL):
    ```bash
    docker compose logs -f sqlserver
    ```
- Stop container:
  - PowerShell:
    ```powershell
    docker compose down
    ```
  - Bash (Linux/macOS/WSL):
    ```bash
    docker compose down
    ```

## Notes
- Database files are persisted in a Docker volume (`sql_data`).
- Initialization runs on container startup via `init/entrypoint.sh`.

## Docker Compose
They are three different actions in Docker Compose:

### build
Builds the image from your Dockerfile.
It does not start containers.

### up
Creates and starts containers, network, and attached resources.
By default it uses the existing image.
If you run up with --build, it rebuilds first, then starts.

### down
- Stops and removes containers and the compose network.
- It does not remove volumes unless you add -v.
- If you use down -v, your database volume is deleted too.

---

### Quick mental model:
- build = make image
- up = run app
- down = stop and remove runtime resources

## For your SQL project:
- Use up -d --build after changing Dockerfile or init scripts.
- Use down when done.
- Use down -v only when you want a full DB reset.

### Command examples
- Build only:
  - PowerShell:
    ```powershell
    docker compose build
    ```
  - Bash (Linux/macOS/WSL):
    ```bash
    docker compose build
    ```
- Start services:
  - PowerShell:
    ```powershell
    docker compose up -d
    ```
  - Bash (Linux/macOS/WSL):
    ```bash
    docker compose up -d
    ```
- Stop and remove services:
  - PowerShell:
    ```powershell
    docker compose down
    ```
  - Bash (Linux/macOS/WSL):
    ```bash
    docker compose down
    ```
