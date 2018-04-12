# frozen_string_literal: true

require 'multi_json'
require 'jwt'
require 'omniauth/strategies/oauth2'
require 'uri'

module OmniAuth
  module Strategies
    class Barong < OmniAuth::Strategies::OAuth2
      option :name, :barong
      option :callback_url
      option :domain, 'barong.io'
      option :use_https, true

      option :api_version, 'v1'

      option  :authorize_url, '/oauth/authorize'
      option  :raw_info_url

      args [
          :client_id,
          :client_secret,
          :domain
      ]

      def client
        options.client_options.site = domain_url
        options.client_options.authorize_url = options.authorize_url
        options.client_options.redirect_uri = callback_url
        super
      end

      def domain_url
        domain_url = URI(options.domain)
        domain_url = URI("#{scheme}://#{domain_url}") unless domain_url.class.in? ([URI::HTTP, URI::HTTPS])
        domain_url.to_s
      end


      uid { raw_info['uid'] }

      info do
        {
            email:  raw_info['email'],
            role:   raw_info['role'],
            level:  raw_info['level'],
            state:  raw_info['state']
        }
      end

      def raw_info
        @raw_info ||= access_token.get(raw_info_url).parsed
      end

      def raw_info_url
        options.raw_info_url || "/api/#{options.api_version}/account"
      end

      def callback_url
        options.callback_url || (full_host + script_name + callback_path)
      end

      private
      def scheme
        options.use_https ? 'https' : 'http'
      end
    end
  end
end
