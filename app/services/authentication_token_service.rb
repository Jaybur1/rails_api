class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALG_TYPE = 'HS256'
  def self.call user_id
    payload = {user_id: user_id}
    JWT.encode payload, HMAC_SECRET, ALG_TYPE
  end

  def self.decode(token)
    if token
      decoded_token, _alg_data = JWT.decode token, HMAC_SECRET, true, {algorithm: ALG_TYPE}
      return decoded_token['user_id']
    end
  end
end