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

      # This option is temporary dynamic due to barong development.
      option  :authorize_url, '/oauth/authorize'
      option  :raw_info_url, 'api/account'

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

      # TODO: if we use 'localhost' as options.domain this will rise exception.
      # Need to change to be able to use localhost as domain for testing.
      # Temporary 'http://localhost' could be used.
      def domain_url
        domain_url = URI(options.domain)
        domain_url = URI("https://#{domain_url}") if domain_url.scheme.nil?
        domain_url.to_s
      end

      uid { raw_info["id"] }

      info do
        {
            :email => raw_info['email'],
            :role => raw_info['role'],
            :level => @raw_info['level']
        }
      end

      def raw_info
        @raw_info ||= access_token.get(options.raw_info_url).parsed
      end

      def callback_url
        options.callback_url || (full_host + script_name + callback_path)
      end
    end
  end
end
