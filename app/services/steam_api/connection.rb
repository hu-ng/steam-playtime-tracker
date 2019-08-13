require 'faraday'

module SteamAPI
  class Connection
    BASE = 'https://api.steampowered.com/'

    def self.api user
      Faraday.new url: BASE,
        params: {steamid: user.steamid,
                 key: ENV['STEAM_API_KEY']}
    end
  end
end
