# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_campus_manager_session',
  :secret      => '1e8e22daed99d1748790f3f31ec30be0089cae7225b978beddb884dd66528db1ea3fa47399bbf2d5e80da8d129481b8d9433a0dff416027b56365095763f8768'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
