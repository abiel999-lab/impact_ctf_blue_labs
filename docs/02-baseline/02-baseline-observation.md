# 02 - Baseline Observation - impact_ctf_blue_labs

## 1. Objective
Establish baseline normal behavior of OWASP Juice Shop using Docker logs
before any attack simulation or hardening is performed.

## 2. Environment
- OS: Windows
- Container Runtime: Docker Desktop
- Monitoring Stack: Grafana + Loki + Promtail
- Log Source: Docker JSON logs

## 3. Baseline Traffic Generation
Duration: ~10 minutes

Normal user activities performed:
1. Homepage access & refresh
2. Product search
3. Product navigation
4. Score Board access
5. Menu navigation

No attack or exploit activities were performed.

## 4. Baseline Log Analysis

### 4.1 All Docker Logs
Query:
{job="docker"}

Observation:
- Logs generated continuously during normal navigation
- Multiple containers produce logs

### 4.2 Juice Shop Related Logs
Query:
{job="docker"} |= "juice"

Observation:
- Application logs visible during user activity
- No abnormal patterns observed

### 4.3 Error Logs
Query:
{job="docker"} |= "error"

Observation:
- (isi: none / minor / recurring)

### 4.4 Authentication Keywords
Query:
{job="docker"} |= "login"

Observation:
- Login-related events observed
- No repeated failures detected

### 4.5 Injection Keywords
Query:
{job="docker"} |= "sql"

Observation:
- No injection-related logs during baseline

### 4.6 Log Rate Baseline
Query:
sum(rate({job="docker"}[1m]))

Observation:
- Log rate stable during normal usage
- No significant spikes detected

## 5. Evidence
Screenshots stored in screenshots/02-baseline/:
- 01-all-docker-logs.png
- 02-juice-filter.png
- 03-error-baseline.png
- 04-login-keyword.png
- 05-injection-baseline.png
- 06-log-rate-baseline.png
- 07-dashboard-baseline.png

## 6. Notes
Initial Loki ingestion issues caused by old Docker log timestamps
were resolved by reconfiguring Promtail to use static file scraping.
