# 05 - Post-Incident Analysis Report
Project: impact_ctf_blue_labs

---

## 1. Executive Summary
A series of suspicious activities were simulated against the OWASP Juice Shop
application to evaluate detection capabilities and defensive controls.
Baseline monitoring identified abnormal patterns including application errors,
authentication abuse, injection-like inputs, and traffic spikes.

Following detection, edge hardening controls were implemented using a reverse
proxy with rate limiting and security headers. Post-hardening observations
showed reduced exposure and improved visibility, confirming the effectiveness
of the applied defensive measures.

---

## 2. Environment Overview
- Operating System: Windows
- Container Platform: Docker Desktop
- Target Application: OWASP Juice Shop
- Monitoring Stack: Grafana + Loki + Promtail
- Defensive Layer: Nginx Reverse Proxy

---

## 3. Incident Timeline

| Phase | Description |
|-----|------------|
| Baseline | Normal user behavior observed and documented |
| Detection | Suspicious patterns identified via log analysis |
| Response | Edge hardening controls applied |
| Post-Hardening | Reduced attack surface and improved monitoring |

---

## 4. Detection & Indicators

### 4.1 Error Indicators
- Application errors triggered by malformed input
- Error keywords appeared in logs after suspicious requests

### 4.2 Authentication Abuse Indicators
- Repeated failed login attempts observed in short time window
- Pattern consistent with brute-force or credential abuse behavior

### 4.3 Injection Attempt Indicators
- SQL/XSS-like payloads detected in application logs
- Keywords not present during baseline observation

### 4.4 Traffic Spike Indicators
- Log rate increased significantly during repeated request simulation
- Clear deviation from established baseline behavior

---

## 5. Response & Hardening Actions

### 5.1 Reverse Proxy Deployment
- Implemented Nginx as edge reverse proxy
- Removed direct host exposure of application port
- Enforced access through controlled entry point

### 5.2 Rate Limiting
- Applied per-IP request rate limiting
- Reduced effectiveness of request flooding and brute-force attempts

### 5.3 Security Headers
- Enforced standard security headers at proxy layer
- Improved baseline web security posture

---

## 6. Before vs After Analysis

| Aspect | Before Hardening | After Hardening |
|------|-----------------|----------------|
| Access Path | Direct access to app | Access via reverse proxy only |
| Rate Control | None | Enforced per-IP rate limiting |
| Headers | Not enforced | Security headers present |
| Log Visibility | Application logs only | Application + proxy logs |

Post-hardening observations show a clear reduction in attack surface and
more actionable logging data for monitoring and analysis.

---

## 7. Lessons Learned & Recommendations

### Lessons Learned
- Baseline observation is critical for accurate detection
- Edge controls significantly reduce attack impact
- Log visibility improves incident response effectiveness

### Recommendations
- Implement alerting on log rate spikes and authentication failures
- Integrate Web Application Firewall (WAF) for advanced filtering
- Forward logs to centralized SIEM for correlation and long-term analysis

---

## 8. Conclusion
This mini-lab successfully demonstrated a full Blue Team workflow:
baseline establishment, detection, response, and post-incident analysis.
The applied controls improved defensive posture while maintaining visibility
required for effective incident response.
