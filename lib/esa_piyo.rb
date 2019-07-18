require "esa_piyo/version"
require "esa"
require "json"

module EsaPiyo
  class Error < StandardError; end

  class Client 
    def initialize(access_token: nil, current_team: nil)
      @client = Esa::Client.new(access_token: access_token, current_team: current_team)
    end

    def screen_name(email: nil)

      params = {
        page: 1,
        per_page: 100,
      }

      begin
        res = @client.members(params)
        body = res.body
        members = body["members"]

        members.each do |member| 
          if member["email"] == email then
            return member["screen_name"]
          end
        end

        params[:page] = body["next_page"]
      end until params[:page].nil?

      return 
    end

    def email(screen_name: nil)

      params = {
        page: 1,
        per_page: 100,
      }

      begin
        res = @client.members(params)
        body = res.body
        members = body["members"]

        members.each do |member| 
          if member["screen_name"] == screen_name then
            return member["email"]
          end
        end

        params[:page] = body["next_page"]
      end until params[:page].nil?

      return 
    end
  end
end
