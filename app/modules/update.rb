module Update
  def update_tracker game
    tracker = game.tracker
    tracker.playtime = game.playtime - tracker.base_playtime
    tracker.save
    if tracker.playtime > tracker.threshold
      TrackerMailer.alert_email(current_user, tracker)
    end
  end

  def update_recent_games
    @games, @errors = SteamAPI::Game.get_recently_played_games
    @games.each do |game|
      metagame = Metagame.find_by_appid(game.appid)
      binding.pry
      user_game = metagame.games.where(user_id: current_user.id)
      unless user_game.playtime == game.playtime_forever
        user_game.playtime = game.playtime_forever
        user_game.save
        if user_game.tracker.present?
          Tracker.update_tracker(user_game)
        end
      end
    end
  end
end
