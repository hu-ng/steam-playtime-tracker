class TrackersController < ApplicationController
  before_action :signed_in_user

  def index
  end

  def new
    @game = current_game
    @tracker = Tracker.new
  end

  def create
    @game = current_game
    @tracker = Tracker.new(tracker_params)
    if @tracker.save
      flash[:success] = "You have created a new tracker for this game!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def tracker_params
    params.require(:tracker).permit(:threshold, :days, :weeks, :months,
                                    :game_id, :base_playtime)
  end

  def current_game
    Game.find_by(id: params[:game_id])
  end

end
