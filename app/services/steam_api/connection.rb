require 'faraday'

module SteamAPI
  class Connection
    BASE = 'https://api.steampowered.com/'

    def self.api
      Faraday.new url: BASE,
        params: {steamid: ENV['MY_USER_ID'],
                 key: ENV['STEAM_API_KEY']}
    end
  end
end
