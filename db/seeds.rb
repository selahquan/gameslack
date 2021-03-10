require 'faker'
Api.get_data.each do |hash|
        platforms_array = hash["platforms"].map do |platform|
            platform["platform"]["name"]
        end 
    
        genres_array = hash["genres"].map do |genre|
            genre["name"]
        end

        clips_array = hash["clip"].each_value do |clip|
            clip
        end

         Game.create(slug: hash["slug"], name: hash["name"], background_image: hash["background_image"], rating: hash["rating"], platform: platforms_array, genre: genres_array, clip: clips_array)
 end

100.times do
    title = Faker::Games::Overwatch.hero
    content = Faker::Games::Overwatch.quote
    posts = Post.new(
        title: title,
        content: content,
    )
    posts.save
end

