-- Query 1: Attendance Status Count
SELECT
    status,
    COUNT(*) AS total_count
FROM attendance_logs
GROUP BY status;

-- Query 2: Late Flag Count
SELECT
    late_flag,
    COUNT(*) AS total_count
FROM attendance_logs
GROUP BY late_flag;

-- Query 3: Average Work Hours for Present Employees
SELECT
    AVG(work_hours) AS avg_work_hours
FROM attendance_logs
WHERE status = 'Present';

-- Query 4: Absent Count by Department
SELECT
    e.field3 AS department,
    COUNT(*) AS absent_count
FROM attendance_logs a
JOIN employees e
ON a.employee_id = e.field1
WHERE a.status = 'Absent'
AND e.field1 != 'employee_id'
AND a.attendance_id != 'attendance_id'
GROUP BY e.field3
ORDER BY absent_count DESC;

-- Query 5: Fire Alerts by Severity
SELECT
    severity,
    COUNT(*) AS total_alerts
FROM fire_alerts
GROUP BY severity;

-- Query 6: Fire Alerts by Floor
SELECT
    floor,
    COUNT(*) AS total_alerts
FROM fire_alerts
GROUP BY floor
ORDER BY total_alerts DESC;

-- Query 7: Average Evacuation Time
SELECT
    AVG(evacuation_time_minutes) AS avg_time
FROM evacuation_logs;

-- Query 8: Evacuation Status Count
SELECT
    evacuation_status,
    COUNT(*) AS total_count
FROM evacuation_logs
GROUP BY evacuation_status;

-- Query 9: SMS Delivery Status Count
SELECT
    delivery_status,
    COUNT(*) AS total_count
FROM sms_logs
GROUP BY delivery_status;
