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

      def authenticated?
        File.exists?(config_file_path) && auth_token && auth_token.length > 0
      end

      def ask_for_credentials
        begin
          identity = ask("Identity: ")
          password = ask("Password: ") { |q| q.echo = false }
          data = Engine.login(identity, password)
          puts 'Identity & password mismatch.' unless data
        end until data
        open(config_file_path, 'w') { |f| f.write data.to_yaml }
      end
    end

    extend ClassMethods
  end
end