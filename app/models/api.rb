class Api < Activerecord::Base

    def self.get_data
        games_array = []

        games_data = RestClient::Request.execute(
            :url => 'https://api.rawg.io/api/games?54b6a98d972c42f2ae857033bc896c8b',
            :method => :get,
            :key => '54b6a98d972c42f2ae857033bc896c8b',

        )
        
        game_array << JSON.parse(response)["results"]
    end
    game_array.each do |t|
        t.each do |game|
            Game.new(game)
        end
    end
end

