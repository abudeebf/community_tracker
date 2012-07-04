class Reflector < ActiveRecord::Base
  def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |reflector|
    reflector.provider = auth.provider
    reflector.uid = auth.uid
    reflector.name = auth.info.name
    reflector.oauth_token = auth.credentials.token
    reflector.oauth_expires_at = Time.at(auth.credentials.expires_at)
    reflector.save!
  end
end
end 