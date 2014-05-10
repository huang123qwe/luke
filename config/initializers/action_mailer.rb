

Rails.application.config.action_mailer.delivery_method = :smtp
# config.action_mailer.perform_deliveries = true
# config.action_mailer.raise_delivery_errors = false
# config.action_mailer.default :charset => "utf-8"
Rails.application.config.action_mailer.smtp_settings = {
  address:              'smtp.163.com',
  port:                 25,
  domain:               '163.com',
  authentication:       'plain',
  enable_starttls_auto: true,
  authentication: :login,
  user_name:            'luke_hr@163.com',
  password:             'luke123456'
}
