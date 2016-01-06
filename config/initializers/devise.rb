# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'info@jobaty.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 5..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.scoped_views = true
  config.secret_key = '9cdd6b3a6e61e623f7f47dbdcecf6ee495c64971125fcdfd60f65a607b846d5dc253794a27050591e5b43e46dddf85dad7707a771a9b71577077bdd97309142b'
end
