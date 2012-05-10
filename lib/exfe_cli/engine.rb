require "eggroll"

module ExfeCli
  class Engine < Eggroll::Engine
    include CliHelper

    default_endpoint 'https://www.exfe.com/v2'

    def login(identity, password)
      post '/users/signin', :external_id => identity, :password => password
    end

    def crosses
      get("/users/crosses?id=#{user_id}&token=#{auth_token}")[:crosses]
    end

    def cross(cross_id)
      get("/crosses/#{cross_id}?token=#{auth_token}")[:cross]
    end

    def conversation(exfee_id)
      get("/conversation/#{exfee_id}?token=#{auth_token}")[:conversation]
    end

    def profile
      get("/users/#{user_id}?token=#{auth_token}")[:user]
    end

    # override
    def parse_response(response)
      if response[:meta][:code] == 200
        response[:response]
      end
    end
  end
end