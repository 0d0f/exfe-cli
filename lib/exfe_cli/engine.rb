require "open-uri"
require "json"
require 'rest_client'

module ExfeCli
  module Engine
    class << self
      def dehydrate(data)
        parse_response JSON(data).recursively_symbolize_keys
      end

      def login(identity, password)
        post '/users/login', :user => identity, :password => password
      end

      def crosses
        # incomplete
        get('/users/13/x?token=43fdd3caf76eb3673308a99b6248439e')[:crosses]
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