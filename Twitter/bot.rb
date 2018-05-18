
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

client2 = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consuTwitter2']
  config.consumer_secret     = ENV['secretApp2']
  config.access_token        = ENV['persoToken2']
  config.access_token_secret = ENV['secretToken2']
end

client3 = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consuTwitter3']
  config.consumer_secret     = ENV['secretApp3']
  config.access_token        = ENV['persoToken3']
  config.access_token_secret = ENV['secretToken3']
end

client4 = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consuTwitter4']
  config.consumer_secret     = ENV['secretApp4']
  config.access_token        = ENV['persoToken4']
  config.access_token_secret = ENV['secretToken4']
end

while true

  tweetmp = 0
  client.search("parcoursup -rt", lang: "fr").take(1).collect do | tweet | 
    if tweet.is_a?(Twitter::Tweet)
      tweetmp = tweet
      client.favorite(tweet)
      puts tweet.text + "a été liké" 
      client.update("@#{tweet.user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement et en groupe, pendant les vacances, c'est ici -> https://w7d4.herokuapp.com/", in_reply_to_status_id: tweet.id, trim_user: true)
      puts "tweet envoyé à #{tweet.user.screen_name}"
    end
  end

  tweet2 = client2.search("parcoursup -rt", lang: "fr").take(2) 
  unless tweet2[0] == tweetmp
    if tweet2[0].is_a?(Twitter::Tweet)
      client2.favorite(tweet2[0])
      puts tweet2[0].text + "a été liké" 
      client2.update("@#{tweet2[0].user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement et en groupe, pendant les vacances, c'est ici -> https://w7d4.herokuapp.com/", in_reply_to_status_id: tweet2[0].id, trim_user: true)
      puts "tweet envoyé à #{tweet2[0].user.screen_name}"
    end
  else
    if tweet2[1].is_a?(Twitter::Tweet)
      client2.favorite(tweet2[1])
      puts tweet2[1].text + "a été liké" 
      client2.update("@#{tweet2[1].user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement et en groupe, pendant les vacances, c'est ici -> https://w7d4.herokuapp.com/", in_reply_to_status_id: tweet2[1].id, trim_user: true)
      puts "tweet envoyé à #{tweet2[1].user.screen_name}"
    end
  end

  client3.search("start-up -rt", lang: "fr").take(1).collect do |tweet3|
    if tweet3.is_a?(Twitter::Tweet)
      tweetmp = tweet3
      client3.favorite(tweet3)
      puts tweet3.text + "a été liké" 
      client3.update("@#{tweet3.user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement et en groupe, pendant les vacances, c'est ici -> https://w7d4.herokuapp.com/lp2", in_reply_to_status_id: tweet3.id, trim_user: true)
      puts "tweet envoyé à #{tweet3.user.screen_name}"
    end
  end

  tweet4 = client4.search("start-up -rt", lang: "fr").take(2) 
  unless tweet4[0] == tweetmp
    if tweet4[0].is_a?(Twitter::Tweet)
      client4.favorite(tweet4[0])
      puts tweet4[0].text + "a été liké" 
      client4.update("@#{tweet4[0].user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement et en groupe, pendant les vacances, c'est ici -> https://w7d4.herokuapp.com/lp2", in_reply_to_status_id: tweet4[0].id, trim_user: true)
      puts "tweet envoyé à #{tweet4[0].user.screen_name}"
    end
  else
    if tweet4[1].is_a?(Twitter::Tweet)
      client4.favorite(tweet4[1])
      puts tweet4[1].text + "a été liké" 
      client4.update("@#{tweet4[1].user.screen_name} Peut etre que t'aurais envie de t'initier au code gratuitement et en groupe, pendant les vacances, c'est ici -> https://w7d4.herokuapp.com/lp2", in_reply_to_status_id: tweet4[1].id, trim_user: true)
      puts "tweet envoyé à #{tweet4[1].user.screen_name}"
    end
  end

  sleep 1800
end

