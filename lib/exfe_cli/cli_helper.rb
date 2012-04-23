require "open-uri"
require "yaml"

module ExfeCli
  module CliHelper
    class << self
      def included(base)
        base.class_eval { include ClassMethods }
      end
    end

    module ClassMethods
      def config_file_path
        File.expand_path '~/.exfe'
      end

      def auth_token
        YAML.load_file(config_file_path)[:auth_token]
      end

      def user_id
        YAML.load_file(config_file_path)[:userid]
      end
    end

    extend ClassMethods
  end
end