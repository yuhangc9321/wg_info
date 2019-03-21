require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    @player_name = params[:player_name]
    @region = params[:region]
    @player = Player.new(@player_name, @region)
    @player.getinfo
    @account_id = @player.playerid[0]["account_id"]
    erb :result
  end
  
end
