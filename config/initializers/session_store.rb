# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cfi_session',
  :secret      => '00b9c77067601c51c96b1ec07df4393f17605821fa6fe87ef007d6bc25ff2bf8f15aef3aa2ea387363f2a067833ea403f7ca3bd9a0bf720668481750ebb4a5b0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
