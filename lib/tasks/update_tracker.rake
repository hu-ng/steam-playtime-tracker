namespace :tracker do
  desc "Task to call Steam API, update trackers, and send mail"
  task update: :environment do
    puts "Starting update (timestamp: #{Time.now})"
    puts "Checking tracker expiry date..."
    Tracker.check_status_trackers
    puts "Updating trackers..."
    Game.update_recent_games
    puts "Update successful!"
  end
end
