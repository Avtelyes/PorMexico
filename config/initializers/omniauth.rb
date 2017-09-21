OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "768254370020920", "7d16e1b2b05f6f21dfb083a6342178fd",
           scope: 'email,public_profile, user_location', display: 'popup'


end