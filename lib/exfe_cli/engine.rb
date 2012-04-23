require "open-uri"
require "json"
require 'rest_client'

module ExfeCli
  module Engine
    class << self
      include CliHelper

      def dehydrate(data)
        parse_response JSON(data).recursively_symbolize_keys
      end

      def login(identity, password)
        post '/users/login', :user => identity, :password => password
      end

      def crosses
        get("/users/#{user_id}/x?token=#{auth_token}")[:crosses]
      end

      def profile
        get("/users/#{user_id}/getprofile?token=#{auth_token}")
      end

      private
      def api_endpoint
        'https://www.exfe.com/v1'
      end

      def get_raw(path)
        open("#{api_endpoint}#{path}") { |f| f.read }
      end

      def get(path)
        dehydrate get_raw(path)
      end

      def post_raw(path, data)
        RestClient.post "#{api_endpoint}#{path}", data
      end

      def post(path, data={})
        dehydrate post_raw(path, data)
      end

      def parse_response(response)
        if response[:meta][:code] == 200
          response[:response]
        end
      end
    end
  end
end