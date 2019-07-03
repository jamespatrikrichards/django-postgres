#!/bin/sh
# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

until PGPASSWORD=$POSTGRES_PASSWORD psql -q -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is currently unavailable... retrying"
  sleep 5
done

>&2 echo "Postgres is up... continuing"
exec $cmd