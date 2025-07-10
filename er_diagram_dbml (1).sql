Table Employees {
  EmployeeID int [pk]
  Name varchar
  Department varchar
  ContactNumber varchar
}

Table Attendance {
  AttendanceID int [pk]
  EmployeeID int [ref: > Employees.EmployeeID]
  CheckInTime datetime
  CheckOutTime datetime
  IsEvacuated boolean
}

Table FireAlerts {
  AlertID int [pk]
  AlertTime datetime
  Status varchar
}

Table SMSLog {
  SMSID int [pk]
  RecipientName varchar
  RecipientContact varchar
  MessageContent text
  SentTime datetime
}
