class GamesController < ApplicationController
  def update
    @games, @errors = SteamAPI::Game.get_all_owned_games current_user
    filter_games @games
    redirect_to root_url
  end
end
