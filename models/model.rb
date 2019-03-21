# require 'discordrb'
require 'discordrb'
require 'wot_api'

# bot = Discordrb::Bot.new token: 'NTUxMDkyNjQwMTEyNzA1NTQ4.D2BFlw.2YD5pttgPCubknMnG4JYxTt7LLU'

# bot.message(start_with: '!stat') do |stat_event|
#     event.respond("work")
# end

# bot.run

WotApi.config({na: '31a4c0221867ed572ae6fe6755f97e3a'})

class Player
    attr_reader :name, :region, :playerid, :playerinfo
    
    def initialize(name, region)
        @name = name
        @region = region.to_sym
        @playerid = nil
        @playerinfo = nil
    end
    
    def getinfo
        @playerid = WotApi.account_list(search: @name, region: @region)
        @playerinfo = WotApi.account_info(search: @name, account_id: @playerid[0]["account_id"])
    end
    
end


        