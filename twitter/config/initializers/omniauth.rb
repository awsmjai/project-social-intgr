Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, "Zdt5obWQTLUiWJ4XNLcWoyuPk", "TZXfdaO9Ee7P2PAx4ZTD4hbss3pJEvLSwmx8ON8GDoH4IULcSx"
end