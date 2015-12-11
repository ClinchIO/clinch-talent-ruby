module ClinchTalent
  class HmacSigningMiddleware < Faraday::Middleware
    def initialize(app, options, &block)
      super(app)
      @options = options
      @block = block
    end

    def call(env)
      env.request_headers['Content-MD5'] = calculated_md5(env)
      env.request_headers['DATE'] = Time.now.utc.httpdate
      env.request_headers["Authorization"] = "APIAuth #{@options[:access_id]}:#{hmac_signature(env, @options[:secret])}"
      @app.call(env)
    end
private
    def calculated_md5(env)
      # if env.request.body
      #   body = env.request.body
      # else
      #  body = ''
      # end
      #excluding the body as part of the md5'ing
      md5_base64digest('')
    end

    def md5_base64digest(string)
      if Digest::MD5.respond_to?(:base64digest)
        Digest::MD5.base64digest(string)
      else
        b64_encode(Digest::MD5.digest(string))
      end
    end

    def b64_encode(string)
      if Base64.respond_to?(:strict_encode64)
        Base64.strict_encode64(string)
      else
        # Fall back to stripping out newlines on Ruby 1.8.
        Base64.encode64(string).gsub(/\n/, '')
      end
    end

    def fetch_headers(env)
      capitalize_keys env.request_headers
    end

    def capitalize_keys(hsh)
      capitalized_hash = {}
      hsh.each_pair {|k,v| capitalized_hash[k.to_s.upcase] = v }
      capitalized_hash
    end

    def hmac_signature(env, secret_key)
      canonical_string = canonical_string(env)
      digest = OpenSSL::Digest.new('sha1')
      b64_encode(OpenSSL::HMAC.digest(digest, secret_key, canonical_string))
    end

    def canonical_string(env)
      [ content_type(env),
        content_md5(env),
        parse_uri(env.url.to_s),
        timestamp(env)
      ].join(',')
    end

    def timestamp(env)
      value = find_header(env, %w(DATE HTTP_DATE))
      value.nil? ? '' : value
    end

    def content_type(env)
      value = find_header(env, %w(CONTENT-TYPE CONTENT_TYPE HTTP_CONTENT_TYPE))
      value.nil? ? '' : value
    end

    def content_md5(env)
      value = find_header(env, %w(CONTENT-MD5 CONTENT_MD5 HTTP-CONTENT-MD5 HTTP_CONTENT_MD5))
      value.nil? ? '' : value
    end

    def find_header(env, keys)
      keys.map {|key| env.request_headers[key] }.compact.first
    end

    def parse_uri(uri)
      uri_without_host = uri.gsub(/https?:\/\/[^(,|\?|\/)]*/, '')
      return '/' if uri_without_host.empty?
      uri_without_host
    end

  end
end