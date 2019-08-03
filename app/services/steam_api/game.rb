module SteamAPI
  class Game < Base
    attr_accessor :appid, :name, :playtime_forever

    def self.get_all_owned_games(include_appinfo=true, include_played_free_games=true)
      response = Request.get_json('IPlayerService/GetOwnedGames/v1/', include_appinfo: include_appinfo, include_played_free_games: include_played_free_games)
      games = response['response']['games'].map { |game| Game.new(game) }
      [ games, response[:errors] ]
    end

    def initialize(args = {})
      super(args)
    end
  end
end
