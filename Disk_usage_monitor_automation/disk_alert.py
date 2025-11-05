#!/usr/bin/python3

import sys
import smtplib
from email.mime.text import MIMEText
from datetime import datetime

# Step 1: Get disk usage value from Bash script argument
usage = sys.argv[1]

# Step2: Print alert to console/log
print(f"[ALERT] Disk usage is {usage}% as of {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")

# Step 3: - send email alert
sender = "sender@gmail.com"
receiver = "receiver@gmail.com"
subject = f" Disk Usage Alert: {usage}%"
body = f"Warning: Your Server disk usage has reached {usage}%. Please take action."

# Step4: Build message
msg = MIMEText(body)
msg["subject"] = subject
msg["From"] = sender
msg ["To"] = receiver

#step 5 : Connect to SMTP server
try:
    with smtplib.SMTP("smtp.gmail.com", 587) as server:
        server.starttls()
        server.login(sender, "your app password")
        server.sendmail(sender, receiver, msg.as_string())
    print("Email alert sent successfully!")
except Exception as e:
          print(f"Failed to send email: {e}")
