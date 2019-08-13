class TrackerMailer < ApplicationMailer

  def alert_email tracker
    @tracker = tracker
    mail(to: @tracker.game.user.email,
         subject: "Alert from SteamTracker about #{@tracker.game.metagame.name}")
  end

  def expired_mail tracker
    @tracker = tracker
    mail(to: @tracker.game.user.email,
         subject: "Alert from SteamTracker about tracker for #{@tracker.game.metagame.name}")
  end
end
