# frozen_string_literal: true

require 'multi_json'
require 'jwt'
require 'omniauth/strategies/oauth2'
require 'uri'

module OmniAuth
  module Strategies
    class BarongOauth2 < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :barong_oauth2

      option :client_options, {
          :site => 'https://barong.kayen.io/',
          :authorize_url => '/oauth/authorize',
          :redirect_uri => 'http://localhost:3000'
      }

      uid { raw_info["id"] }

      info do
        {
            :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
