Gem::Specification.new do |s|
  s.name        = 'clinch-talent'
  s.version     = '0.2.4'
  s.summary     = 'A ruby client for the Clinch Talent API'
  s.description = 'A ruby client for the Clinch Talent API. Requests are HMAC signed. Responses are in JSON API format (https://jsonapi.org). https://knowledgeportal.pageuppeople.com/article/clinch-api-getting-started/'
  s.authors     = ['Damien Glancy', 'Steve Quinlan']
  s.email       = 'damieng@pageuppeople.com'
  s.homepage    = 'http://rubygems.org/gems/clinch-talent'
  s.license       = 'MIT'
  s.add_dependency 'json_api_client', '~> 1.16.1'
  s.add_development_dependency 'mocha', '~> 1.11.2'
  s.add_development_dependency 'webmock', '~> 3.8.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
