namespace :botwitter do
  desc "Gentil bot twitter !"
  task send_tweet: :environment do
    BotTwitter.new.perform
end
end
