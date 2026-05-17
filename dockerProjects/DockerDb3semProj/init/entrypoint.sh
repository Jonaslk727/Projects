#!/usr/bin/env bash
set -euo pipefail

/opt/mssql/bin/sqlservr &

# Wait until SQL Server accepts connections.
for i in {1..60}; do
  if /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "${MSSQL_SA_PASSWORD}" -C -Q "SELECT 1" >/dev/null 2>&1; then
    echo "SQL Server is ready."
    break
  fi
  echo "Waiting for SQL Server startup ($i/60)..."
  sleep 2
done

if ! /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "${MSSQL_SA_PASSWORD}" -C -Q "SELECT 1" >/dev/null 2>&1; then
  echo "SQL Server did not become ready in time."
  exit 1
fi

echo "Applying schema: init.sql"
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "${MSSQL_SA_PASSWORD}" -C -i /usr/config/init.sql

echo "Applying seed data: mockData.sql"
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "${MSSQL_SA_PASSWORD}" -C -i /usr/config/mockData.sql

wait
