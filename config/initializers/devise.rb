Devise.setup do |config|
  config.secret_key = 'f6a0fe85f9ac9f004a0d7e32a2e19a42b45668eb4f1ab76081405e7825cb11b0975237fb785991bda5b61752f19272de12bb66b01b1e8ad19f64c2c312a5103c'

  # TODO: customize this
  config.mailer_sender = "sender@mail.com"

  require 'devise/orm/active_record'

  config.scoped_views = true

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = false

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..72

  config.reset_password_within = 6.hours

  config.sign_out_via = :get
end
