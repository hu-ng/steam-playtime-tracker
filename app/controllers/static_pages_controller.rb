class StaticPagesController < ApplicationController
  before_action :sign_in_user

  def home
    @games = Game.get_all_for_user(current_user.id)
  end

  def about
  end

  private

  def sign_in_user
    if !signed_in?
      redirect_to login_path
    end
  end
end
