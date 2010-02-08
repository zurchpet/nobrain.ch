# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nobrain.ch_session',
  :secret      => '59f7f7fa0f54d9d7eb2210f101fcc9bb9da6dc51b513328a1b63c715e2cd4b429376b012d4e96ed2928a2c0129033d2c6f44e6bf793d4932486cc21449b9ee5b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
