# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_campus_manager_session',
  :secret      => '8290ed216b3bccfea393dad08116a5fc623a1d8e99a460ec21ebc94ae1b4136f44a7059a0e8be11775d46fa7850ac6f16d159bdde54004a18f6c84295c3f8f00'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
