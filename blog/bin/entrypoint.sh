#!/bin/bash
set -e

bundle install

# Remove a potentially pre-existing server.pid for Rails.
rm -f /blog/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"