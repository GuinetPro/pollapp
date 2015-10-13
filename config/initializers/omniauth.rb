Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "965623892648-cmj92s0qi90fqm2j54hvm1371p9m1ult.apps.googleusercontent.com", "eB17fG6qBuWmM1pvg8RPEk8y"
end