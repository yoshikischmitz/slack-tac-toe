require 'slack-ruby-bot'
require './tictactoe.rb'
require 'pry'

def get_index(users)
  users.map{|x| [x.second["name"], x.first] }.to_h
end

# Written in an hour and then some for a URUG hack night.
# While you can't cheat it isn't particularly good at handling edgecases.
class TicTacToeBot < SlackRubyBot::Bot
  @@games = {}

  command 'I challenge' do |client, data, str|
    match_data = str['expression'].match(/(.+) to a duel/)[1]

    index = get_index(client.users)
    challengee = index[match_data]

    game = Game.new(data.user, challengee)

    @@games[data.user] ||= {}
    @@games[data.user] = game
    @@games[challengee] = game

    client.say(channel: data.channel, text: "Game has started! Remember, you can only play against one person at a time!")
    client.say(channel: data.channel, text: game.to_s)
  end

  command "I place at" do |client, data, str|
    game = @@games[data.user]

    match_data = str['expression'].match(/(\d) (\d)/)

    result = game.place(match_data[1].to_i, match_data[2].to_i, data.user)

    client.say(channel: data.channel, text: result)
  end
end

TicTacToeBot.run
