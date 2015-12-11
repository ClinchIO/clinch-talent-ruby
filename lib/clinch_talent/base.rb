module ClinchTalent
  class Base < ::JsonApiClient::Resource
    def self.config(access_id, secret, options = {})
      self.site = options[:site] || 'https://api.clinchtalent.com/v1/'
      self.connection do |connection|
        connection.use HmacSigningMiddleware, {access_id: access_id, secret: secret}
        connection.use Faraday::Response::Logger
      end
    end
  end
end