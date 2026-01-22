# 03 - Attack Simulation & Detection - impact_ctf_blue_labs

## 1. Objective
Simulate suspicious activities against OWASP Juice Shop and
identify indicators through Docker log monitoring.

## 2. Simulated Activities

### 2.1 Error Triggering
Method:
- Malformed input via browser

Detection Query:
{job="docker"} |= "error"

Observation:
- Application errors observed after malformed input
- No similar pattern found in baseline logs

### 2.2 Authentication Abuse
Method:
- Repeated failed login attempts

Detection Query:
{job="docker"} |= "login"

Observation:
- Multiple login failures in short time window
- Pattern consistent with brute-force behavior

### 2.3 Injection Attempt
Method:
- SQL/XSS-like payloads via input fields

Detection Query:
{job="docker"} |= "sql"

Observation:
- Injection-related keywords detected
- Payload patterns identifiable in logs

### 2.4 Traffic Spike
Method:
- Rapid repeated requests

Detection Query:
sum(rate({job="docker"}[1m]))

Observation:
- Log rate spike detected
- Deviation from baseline behavior

## 3. Incident Summary
Multiple indicators of suspicious activity were successfully
generated and detected, providing sufficient evidence for
incident response and hardening actions.

## 4. Evidence
Screenshots stored in screenshots/03-detection/
