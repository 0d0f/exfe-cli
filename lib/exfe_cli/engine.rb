require "open-uri"
require "json"

module ExfeCli
  module Engine
    class << self
      def jsonize(data)
        JSON(data)
      end

      def login(username, password)

      end

      private
      def api_endpoint
        'https://www.exfe.com/v1'
      end

      def get_raw(path)
        open("#{api_endpoint}#{path}") { |f| f.read }
      end

      def get(path)
        jsonize(get_raw(path)).recursively_symbolize_keys
      end
    end
  end
end