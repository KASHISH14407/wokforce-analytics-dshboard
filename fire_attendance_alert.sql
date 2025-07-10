-- Simplified, SQLite-compatible Fire Emergency Attendance Tracking Project for error-free execution

CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INTEGER PRIMARY KEY,
    Name TEXT,
    Department TEXT,
    ContactNumber TEXT
);

CREATE TABLE IF NOT EXISTS Attendance (
    AttendanceID INTEGER PRIMARY KEY AUTOINCREMENT,
    EmployeeID INTEGER,
    CheckInTime TEXT,
    CheckOutTime TEXT,
    IsEvacuated BOOLEAN DEFAULT 0,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE IF NOT EXISTS FireAlerts (
    AlertID INTEGER PRIMARY KEY AUTOINCREMENT,
    AlertTime TEXT DEFAULT CURRENT_TIMESTAMP,
    Status TEXT DEFAULT 'Fire Detected'
);

CREATE TABLE IF NOT EXISTS SMSLog (
    SMSID INTEGER PRIMARY KEY AUTOINCREMENT,
    RecipientName TEXT,
    RecipientContact TEXT,
    MessageContent TEXT,
    SentTime TEXT DEFAULT CURRENT_TIMESTAMP
);

INSERT OR IGNORE INTO Employees (EmployeeID, Name, Department, ContactNumber) VALUES
(1, 'Ananya Sharma', 'HR', '+911112223334'),
(2, 'Rohit Singh', 'Engineering', '+911112223335'),
(3, 'Neha Verma', 'Finance', '+911112223336');

INSERT INTO Attendance (EmployeeID, CheckInTime) VALUES
(1, datetime('now', '-2 hours')),
(2, datetime('now', '-1 hour'));

-- Since SQLite does not support procedural triggers with loops, we will manually simulate alert generation:

INSERT INTO FireAlerts (Status) VALUES ('Fire Detected');

INSERT INTO SMSLog (RecipientName, RecipientContact, MessageContent)
SELECT e.Name, e.ContactNumber,
       '🚨 Fire Alert: ' || e.Name || ', please evacuate immediately.'
FROM Employees e
JOIN Attendance a ON e.EmployeeID = a.EmployeeID
WHERE a.CheckOutTime IS NULL;

-- View simulated SMS alerts sent
SELECT * FROM SMSLog;

-- View currently present employees during the fire
SELECT e.Name, e.Department, a.CheckInTime
FROM Employees e
JOIN Attendance a ON e.EmployeeID = a.EmployeeID
WHERE a.CheckOutTime IS NULL;
