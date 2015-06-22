ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mandrillapp.com",
  :port                 => 587,
  :enable_starttls_auto => true,
  :domain               => "pivoter.cl",
  :user_name            => "sergio.cardenas@pivoter.cl",
  :password             => "IBbGI6kStAAbPdbZYyluPw",
  :authentication       => "login",

}
ActionMailer::Base.default_url_options[:host] = "localhost:3000"

MandrillMailer.configure do |config|
  config.api_key = "IBbGI6kStAAbPdbZYyluPw"
end