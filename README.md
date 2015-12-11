# clinch-talent-ruby
A ruby client for the Clinch Talent API. Glues the json-api-client gem with HMAC signing and predefined models.

[![Build Status](https://travis-ci.org/ClinchIO/clinch-ruby-client.svg)](https://travis-ci.org/ClinchIO/clinch-ruby-client)

##Getting Started

This Ruby client allows developers to connect to the Clinch Talent API to access their data. In order to use the client you must have a valid Clinch Talent account and valid API keys. The steps to obtain keys can be found in the [developer documentation](http://dev.clinch.io/docs/api_getting_started).

##Using the Gem

Install the gem:

```

gem install clinch-talent

```

Require the gem:

```ruby

require 'clinch-talent'

```

Use the gem to get candidate data:

```ruby

ClinchTalent::Base.config("YOUR-KEY", "YOUR-SECRET")
ClinchTalent::Candidate.all # Get data for the collection of candidates
ClinchTalent::Candidate.find('candidate-id') # Get data for an individual candidate using the candidate's ID

```

Run these tests with rake test
