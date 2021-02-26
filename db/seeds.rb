Api.get_data.each do |hash|
    Game.create(slug: hash["slug"], name: hash["name"], background_image: hash["background_image"], rating: hash["rating"])
end

