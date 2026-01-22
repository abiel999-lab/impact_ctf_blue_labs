$ErrorActionPreference = "Stop"

Write-Host "Stopping Blue Lab containers..." -ForegroundColor Yellow
docker compose -f .\compose\docker-compose.yml down
Write-Host "Stopped." -ForegroundColor Green
