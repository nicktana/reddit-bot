 # Validate required fields
    reddit_fields = [client_id, client_secret, user_agent, username, password, post_url]
    twilio_fields = [twilio_account_sid, twilio_auth_token, twilio_from_number, twilio_to_number]
    
    if not all(reddit_fields):
        print("Error: Missing required Reddit configuration")
        exit(1)
    
    if not all(twilio_fields):
        print("Error: Missing required Twilio configuration")
        exit(1)
    
    # Create Reddit instance
    reddit = praw.Reddit(
        client_id=client_id,
        client_secret=client_secret,
        user_agent=user_agent,
        username=username,
        password=password
    )
    
    # Create Twilio client
    twilio_client = Client(twilio_account_sid, twilio_auth_token)
    
    # Start monitoring
    monitor_post_replies(reddit, twilio_client, config)
