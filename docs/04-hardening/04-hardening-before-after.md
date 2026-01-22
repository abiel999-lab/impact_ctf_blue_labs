# 04 - Hardening (Before/After) - impact_ctf_blue_labs

## 1. Objective
Apply edge hardening controls (reverse proxy, security headers, rate limiting)
to reduce attack surface and improve monitoring evidence.

## 2. Before Hardening
- User accessed app directly via http://localhost:3000
- No edge rate limiting
- No enforced security headers at proxy layer

## 3. Changes Implemented
### 3.1 Reverse Proxy
- Added Nginx reverse proxy container
- Exposed only Nginx to host: http://localhost:8080
- Removed host port mapping for Juice Shop (3000 not exposed)

### 3.2 Security Headers
- X-Content-Type-Options: nosniff
- X-Frame-Options: DENY
- Referrer-Policy: no-referrer

### 3.3 Rate Limiting
- Nginx limit_req enabled to reduce brute force / request flooding

## 4. Verification (After Hardening)
### 4.1 Access Path Verification
- http://localhost:8080 reachable and serves Juice Shop UI
- docker ps confirms Juice Shop port 3000 is not exposed to host

### 4.2 Headers Verification
- Verified response headers via PowerShell Invoke-WebRequest

### 4.3 Rate Limit Verification
- Burst requests generated via PowerShell loop
- Nginx logs show rate limiting behavior

### 4.4 Monitoring Verification
- Nginx logs visible in Grafana/Loki

## 5. Evidence (Screenshots)
Stored in screenshots/04-hardening/
- 01-access-via-nginx-8080.png
- 02-docker-ports-after.png
- 03-security-headers.png
- 04-rate-limit-nginx-logs.png
- 05-grafana-nginx-logs.png

## 6. Notes / Issues
- Nginx startup initially failed due to UTF-8 BOM in nginx.conf (invisible character before worker_processes).
  Resolved by saving file as UTF-8 (no BOM).
