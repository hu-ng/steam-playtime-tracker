class Game < ApplicationRecord
  include SessionsHelper

  belongs_to :metagame
  belongs_to :user
  has_one :tracker

  validates :playtime, presence: true

  scope :get_all_for_user, -> (id) { where(user_id: id) }

  # for every user in the system
  # small solution, not scalable
  def self.update_recent_games
    User.all.each do |user|
      @games, @errors = SteamAPI::Game.get_recently_played_games user
      @games.each do |game|
        metagame = Metagame.find_by_appid(game.appid)
        user_game = metagame.games.where(user_id: user.id).first
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

end
