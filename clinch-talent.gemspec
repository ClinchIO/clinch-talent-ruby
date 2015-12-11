Gem::Specification.new do |s|
  s.name        = 'clinch-talent'
  s.version     = '0.0.1'
  s.date        = '2015-12-11'
  s.summary     = 'A ruby client for the Clinch Talent API'
  s.description = 'A ruby client for the Clinch Talent API. Requests are HMAC signed. Responses are in JSON API format (https://jsonapi.org). See https://dev.clinch.io/v1.0/docs/api_getting_started'
  s.authors     = ['Damien Glancy', 'Peter Keogh', 'Steve Quinlan']
  s.email       = 'damien@clinch.io'
  s.homepage    = 'http://rubygems.org/gems/clinch-talent'
  s.license       = 'MIT'
  s.add_development_dependency 'json_api_client', '~> 1.0'
  s.add_development_dependency 'mocha', '~> 1.1'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
