require_relative '../test_helper'

module ClinchTalent
  class CandidateTest < Minitest::Test
    def test_get_candidates
      # access_id = <access_id>
      # secret = <secret>
      # options = {site: <clinch url>}
      ClinchTalent::Base.config(access_id, secret)
      candidates = ClinchTalent::Candidate.includes(:social_profile).all
      puts candidates[0].social_profile.links.linked_in['url']
    end
  end
end
