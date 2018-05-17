require 'twitter'
require 'dotenv'
require 'pry'
Dotenv.load('.env')

client = Twitter::REST::Client.new do | config |
  config.consumer_key        = ENV['consuTwitter']
  config.consumer_secret     = ENV['secretApp']
  config.access_token        = ENV['persoToken']
  config.access_token_secret = ENV['secretToken']
end


while true
client.search("parcoursup -rt", lang: "fr").take(100).collect do | tweet | 
client.update("@#{tweet.user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement, pendant les vacances, c'est ici -> https://thplille.herokuapp.com/hackers", in_reply_to_status_id: tweet.id, trim_user: true)
puts "tweet envoyé à #{tweet.user.screen_name}"
sleep 1800
end
end


