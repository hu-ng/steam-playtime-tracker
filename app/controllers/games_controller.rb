class GamesController < ApplicationController
  def update
    @games, @errors = SteamAPI::Game.get_all_owned_games
    filter_games @games
    Update.update_recent_games
    redirect_to root_url
  end
end
