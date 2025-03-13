FROM python:3.11-slim

WORKDIR /app

# Copy the notification script
COPY reddit_notification.py .

# Install Python dependencies
RUN pip install --no-cache-dir praw twilio

# Create a configuration file template
RUN echo '{\n\
  "client_id": "YOUR_CLIENT_ID",\n\
  "client_secret": "YOUR_CLIENT_SECRET",\n\
  "user_agent": "Reply Notifier by YOUR_USERNAME",\n\
  "username": "YOUR_REDDIT_USERNAME",\n\
  "password": "YOUR_REDDIT_PASSWORD",\n\
  "post_url": "REDDIT_POST_URL",\n\
  "check_interval": 60,\n\
  "twilio_account_sid": "YOUR_TWILIO_ACCOUNT_SID",\n\
  "twilio_auth_token": "YOUR_TWILIO_AUTH_TOKEN",\n\
  "twilio_from_number": "YOUR_TWILIO_PHONE_NUMBER",\n\
  "twilio_to_number": "YOUR_PERSONAL_PHONE_NUMBER"\n\
}' > /app/config.json.template

# Run the script when the container launches
CMD ["python", "reddit_notification.py"]
