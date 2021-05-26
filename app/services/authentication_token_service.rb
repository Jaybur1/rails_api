class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALG_TYPE = 'HS256'
  def self.call
    payload = {"test" => "blob"}
    JWT.encode payload, HMAC_SECRET, ALG_TYPE
  end
end