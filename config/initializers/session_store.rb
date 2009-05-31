# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prawn_xsendfile_session',
  :secret      => '4752a440724496a1003925326510bef62226d074c05b8040714d67817407c812d55567994a2764a39b4b2e92bb92a67a90f977c7bb33cd928c5f6265361ca3ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
