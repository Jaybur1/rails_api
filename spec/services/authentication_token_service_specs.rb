require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do
    let(:token) { described_class.call }
    it "it returns authentication token" do
      decoded_token = JWT.decode(
        token,
        described_class::HMAC_SECRET,
        true,
        {algorithm: described_class::ALG_TYPE}
      )
      expect(decoded_token).to eq([{"test"=>"blob"},{"alg"=>described_class::ALG_TYPE}])
    end
  end
end