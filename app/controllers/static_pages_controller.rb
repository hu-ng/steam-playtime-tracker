class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: :home

  def home
    @games = Game.get_all_for_user(current_user.id)
  end

  def about
  end

end
