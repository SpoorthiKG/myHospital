# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myHospital_session',
  :secret      => '9d8616fcd5824f21fb6b2e1481506d619b509b9407b51c8903a492d922425b487ae6c3967d7ebd2a527be69c0aba7e90ebec8593de327e71b2379fd75c02df36'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
