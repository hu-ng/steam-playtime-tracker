module GamesHelper

  def filter_games(games)
    games.each do |game|
      if Metagame.find_by_appid(game.appid).nil?
        metagame = Metagame.create(name: game.name, appid: game.appid)
        metagame.games.build(playtime: game.playtime_forever, user_id: current_user.id).save
      else
        metagame = Metagame.find_by_appid(game.appid)
        game = metagame.games.where(user_id: current_user.id)
         unless game
           metagames.games.build(playtime: game.playtime_forever, user_id: current_user.id).save
         end
      end
    end
  end

end
