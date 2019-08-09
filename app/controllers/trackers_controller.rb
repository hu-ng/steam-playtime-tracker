class TrackersController < ApplicationController
  before_action :signed_in_user

  def index
    @trackers = Tracker.all
  end

  def new
    @game = current_game
    @tracker = Tracker.new
  end

  def create
    @game = current_game
    @tracker = Tracker.new(tracker_params)
    if @tracker.save
      flash[:success] = "You have created a new tracker for #{@game.metagame.name}!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @game = current_game
    @tracker = Tracker.find_by(id: params[:id])
  end

  def update
    @game = current_game
    @tracker = Tracker.find_by(id: params[:id])
    if @tracker.update_attributes(tracker_params)
      flash[:success] = "#{@game.metagame.name} tracker updated"
      redirect_to trackers_path
    else
      render 'edit'
    end
  end

  def destroy
    @tracker = Tracker.find_by(id: params[:id])
    @tracker.destroy
    flash[:success] = "Tracker deleted."
    redirect_to trackers_path
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
