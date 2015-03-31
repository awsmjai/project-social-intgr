OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, '50c3b1af58b846278e6f2540d34f3f03', 'd2a5d517fb074e108f88196b8245a025'
  provider :google_oauth2, '755203075753-1lenaoa01rp6r753vnfioblkg3ht2l0h.apps.googleusercontent.com', 'yBp1QhWA3q2tLGE-ZHaCS24X'
end