#!/bin/bash
# Run this once before starting any Docker containers from IntelliJ
# Creates the network on both Docker daemons (IntelliJ uses system Docker, terminal uses Docker Desktop)

echo "Creating patient-network on System Docker (IntelliJ)..."
DOCKER_HOST=unix:///var/run/docker.sock docker network create patient-network 2>/dev/null \
  && echo "✅ Created on system Docker" || echo "✅ Already exists on system Docker"

echo "Creating patient-network on Docker Desktop (terminal)..."
docker network create patient-network 2>/dev/null \
  && echo "✅ Created on Docker Desktop" || echo "✅ Already exists on Docker Desktop"
