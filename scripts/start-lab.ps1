$ErrorActionPreference = "Stop"

Write-Host "Starting Blue Lab containers..." -ForegroundColor Cyan
docker compose -f .\compose\docker-compose.yml up -d

Write-Host "`nLab is starting. URLs:" -ForegroundColor Green
Write-Host "Juice Shop (via NGINX hardened entry) : http://localhost:8080"
Write-Host "Grafana                            : http://localhost:3001  (user: admin / pass: admin)"
Write-Host "Loki                               : http://localhost:3100"

Write-Host "`nNotes:" -ForegroundColor Yellow
Write-Host "- Direct access to Juice Shop container port 3000 is internal-only (not published)."
Write-Host "- Use NGINX (8080) for all testing in Step 4."
