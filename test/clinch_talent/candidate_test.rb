require_relative '../test_helper'

module ClinchTalent
  class CandidateTest < Minitest::Test
    def test_signing
      Time.stubs(:now).returns(Time.new(2014, 01, 01, 01, 01, 01))

      # Having problem stubbing the body response, so not doing this now

      stub_request(:get, 'https://api.clinchtalent.com/v1/candidates?include=social_profile').
        with(:headers => {'Accept' => 'application/vnd.api+json',
                          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                          'Authorization' => 'APIAuth access_id:mCPWePkgbJo3G9JSDrtdtQrKGek=',
                          'Content-Md5' => '1B2M2Y8AsgTpgAmY7PhCfg==',
                          'Content-Type' => 'application/vnd.api+json',
                          'Date' => 'Wed, 01 Jan 2014 01:01:01 GMT',
                          'User-Agent' => 'Faraday v0.9.2'})
      ClinchTalent::Base.config('access_id', 'secret')
      ClinchTalent::Candidate.includes(:social_profile).all
    end
  end
end