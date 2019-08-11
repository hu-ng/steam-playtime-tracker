class TrackerMailer < ApplicationMailer

  def alert_email(user, tracker)
    @user = user
    @tracker = tracker
    mail(to: @user.email,
         subject: "Alert from SteamTracker about #{@tracker.game.metagame.name}")
  end
end
