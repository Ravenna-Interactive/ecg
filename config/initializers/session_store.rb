# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_emeraldcg_session',
  :secret      => '64132c0f4e5199eaed97fe1aab8c9b4964561faf37c1da4a97e655797b7a71d21cd890063c35a2d794b4f5a86927fd12c9af2923e807af853e8f7fb7dd52f9ba'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
