require 'twitter'
require 'google_drive'
require 'dotenv'
Dotenv.load('script.env',)

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|

  config.consumer_key        = ENV['consumerkey']
  config.consumer_secret     = ENV['consumersecret']
  config.access_token        = ENV['accesstoken']
  config.access_token_secret = ENV['accesstoken_secret']
end

client.search("start-up -rt", lang: "fr").take(1).collect do |object|
	client.update("@#{object.user.screen_name} Je te présente The Hacking Project, une formation au code en pair-programming qui pourra t'aider dans ton projet, retrouve nous sur https://thplille.herokuapp.com/hackers ", in_reply_to_tweet_id: object.id )
sleep(120)
end
