require "esa_piyo/version"
require "esa"

module EsaPiyo
  class Error < StandardError; end

  class Client 
    def initialize(access_token: nil, current_team: nil)
      @client = Esa::Client.new(access_token: access_token, current_team: current_team)
    end
  end
end
