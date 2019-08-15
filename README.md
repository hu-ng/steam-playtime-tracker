# Steam Playtime Tracker
An app that let's you put a tracker on the playing time of any game and send email notifications accordingly. Relies on the Steam Web API to work.

## Setting up
To run the app in a local server after cloning the repo:
1. Make sure to have the latest version of Ruby
2. Run `bundle install` to get dependencies
3. Create an `.env` file at the root project folder with `STEAM_API_KEY=<your key>`. You can get your own key [here](https://steamcommunity.com/dev/apikey). Also make sure that your Steam profile is made public, more info [here](https://support.steampowered.com/kb_article.php?ref=4113-YUDH-6401)
4. Run `whenever --update-crontab` to start scheduling API calls to Steam. This project uses the [Whenever](https://github.com/javan/whenever) gem to automate calls in a local server
5. Finally, do `rails s` to start the local server

## TODO
- UI improvements much needed
- Deploy to Heroku with scheduler configured. Will need to refactor to accept user's own API key.
