class GamesController < ApplicationController
  def update
    @games, @errors = SteamAPI::Game.get_all_owned_games
  end
end
