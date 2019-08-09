require_relative '../test_helper'

class ClinchTalent::JobDepartmentTest < Minitest::Test
  def setup
    Time.stubs(:now).returns(Time.new(2014, 01, 01, 01, 01, 01))
  end

  def test_get_signing
    stub_request(:get, 'https://api.clinchtalent.com/v1/job_departments').
      with(:headers => {'Accept' => 'application/vnd.api+json',
                        'Authorization' => 'APIAuth access_id:a6qLnFKzp9cObEdcXmKw5zOtLRU=',
                        'Content-Md5' => '1B2M2Y8AsgTpgAmY7PhCfg==',
                        'Content-Type' => 'application/vnd.api+json',
                        'Date' => 'Wed, 01 Jan 2014 01:01:01 GMT'})
    ClinchTalent::Base.config('access_id', 'secret')
    ClinchTalent::JobDepartment.all
  end
end
