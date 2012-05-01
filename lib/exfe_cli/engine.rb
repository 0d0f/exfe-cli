require "eggroll"

module ExfeCli
  class Engine < Eggroll::Engine
    include CliHelper

    default_endpoint 'https://www.exfe.com/v1'

    def login(identity, password)
      post '/users/login', :user => identity, :password => password
    end

    def crosses
      get("/users/#{user_id}/x?token=#{auth_token}")[:crosses]
    end

    def cross(cross_id)
      crosses = get("/users/#{user_id}/x?token=#{auth_token}")[:crosses]
      crosses.select { |c| c[:id] == cross_id.to_s }.first
    end

    def profile
      get "/users/#{user_id}/getprofile?token=#{auth_token}"
    end

    # override
    def parse_response(response)
      if response[:meta][:code] == 200
        response[:response]
      end
    end
  end
end