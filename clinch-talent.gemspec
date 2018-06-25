Gem::Specification.new do |s|
  s.name        = 'clinch-talent'
  s.version     = '0.11'
  s.summary     = 'A ruby client for the Clinch Talent API'
  s.description = 'A ruby client for the Clinch Talent API. Requests are HMAC signed. Responses are in JSON API format (https://jsonapi.org). See https://support.clinchtalent.com/article/77-getting-started'
  s.authors     = ['Damien Glancy', 'Steve Quinlan']
  s.email       = 'damien@clinchtalent.com'
  s.homepage    = 'http://rubygems.org/gems/clinch-talent'
  s.license       = 'MIT'
  s.add_dependency 'json_api_client', '~> 1.5'
  s.add_development_dependency 'mocha', '~> 1.1'
  s.add_development_dependency 'webmock'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
