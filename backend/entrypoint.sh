#!/bin/bash
set -e

host="$DB_HOST"

until pg_isready -h "$host" -p "5432"; do
  >&2 echo "⏳ Postgres is unavailable - sleeping"
  sleep 2
done

>&2 echo "✅ Postgres is up - starting application"
exec dotnet backend.dll
