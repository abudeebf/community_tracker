OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '362362653836443', '76076fdb6729f02e0890d1c9fe356a91'
end