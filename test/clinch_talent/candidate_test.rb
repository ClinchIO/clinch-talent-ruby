require_relative '../test_helper'

class ClinchTalent::CandidateTest < Minitest::Test
  def setup
    Time.stubs(:now).returns(Time.new(2014, 01, 01, 01, 01, 01))
  end

  def test_get_signing
    stub_request(:get, 'https://api.clinchtalent.com/v1/candidates').
      with(:headers => {'Accept' => 'application/vnd.api+json',
                        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                        'Authorization' => 'APIAuth access_id:BNBb+1TD1ZW2v2KInKm0EtDCrdg=',
                        'Content-Md5' => '1B2M2Y8AsgTpgAmY7PhCfg==',
                        'Content-Type' => 'application/vnd.api+json',
                        'Date' => 'Wed, 01 Jan 2014 01:01:01 GMT',
                        'User-Agent' => 'Faraday v0.15.2'})
    ClinchTalent::Base.config('access_id', 'secret')
    ClinchTalent::Candidate.all
  end

  def test_post_signing
    stub_request(:post, "https://api.clinchtalent.com/v1/candidates").
      with(
        body: "{\"data\":{\"type\":\"candidates\",\"attributes\":{\"first_name\":\"Steve\",\"last_name\":\"Jobs\",\"email\":\"steve.jobs@example.com\"}}}",
        headers: {
          'Accept' => 'application/vnd.api+json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'APIAuth access_id:GpqVWbyL6re9hA4PVFciK9JGXtE=',
          'Content-Md5' => 'BHelHgS90QHICtQEYCK1CA==',
          'Content-Type' => 'application/vnd.api+json',
          'Date' => 'Wed, 01 Jan 2014 01:01:01 GMT',
          'User-Agent' => 'Faraday v0.15.2'
        }).
      to_return(status: 200, body: "", headers: {})

    ClinchTalent::Base.config('access_id', 'secret')
    ClinchTalent::Candidate.create("first_name": "Steve", "last_name": "Jobs", "email": "steve.jobs@example.com")
  end

  def test_post_signing_no_body
    stub_request(:post, "https://api.clinchtalent.com/v1/candidates").
      with(:body => "{\"data\":{\"type\":\"candidates\",\"attributes\":{}}}",
           :headers => {'Accept' => 'application/vnd.api+json', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                        'Authorization' => 'APIAuth access_id:P9RDanGcxbHK/aWLPC/T6Eitplc=',
                        'Content-Md5' => 'hy9ALXrYXtG7YZXuVdXzjA==',
                        'Content-Type' => 'application/vnd.api+json',
                        'Date' => 'Wed, 01 Jan 2014 01:01:01 GMT',
                        'User-Agent' => 'Faraday v0.15.2'}).
      to_return(:status => 200, :body => "", :headers => {})

    ClinchTalent::Base.config('access_id', 'secret')
    ClinchTalent::Candidate.create
  end

end
