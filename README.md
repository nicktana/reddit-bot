# reddit-bot

## Introduction
The script utilizes python, the reddit API and Twilio in order to function. The purpose of this script is to send notification to the owner of a Reddit thread via SMS in order to ensure a timely response.

## Getting Started

### Reddit API

- Go to https://www.reddit.com/prefs/apps
- Click "create another app..." at the bottom
- Fill in the name, select "script", and add a redirect URI (http://localhost works)
- After creation, note your client ID (under the app name) and client secret
- Replace YOUR_CLIENT_ID and YOUR_CLIENT_SECRET with your API credentials
- Update YOUR_USERNAME and YOUR_REDDIT_PASSWORD with your Reddit login details
- Modify YOUR_USERNAME in the user agent string

### Twilio

- Go to Twilio's website and sign up for an account
- Once registered, you'll receive:
- Account SID
- Auth Token
- A Twilio phone number (or you can purchase one)
- In your config.json file, add the following Twilio-specific settings:
  - twilio_account_sid: Your Twilio account SID
  - twilio_auth_token: Your Twilio auth token
  - twilio_from_number: Your Twilio phone number (format: +1XXXXXXXXXX)
  - twilio_to_number: Your personal phone number to receive SMS (format: +1XXXXXXXXXX)
 
### Building and Running the Container

- cd into your cloned folder
- run docker build -t reddit-notifier .
- run docker run -d --name reddit-notifier -v $(pwd)/config.json:/app/config.json reddit-notifier
- to check logs run docker logs -f reddit-notifier
