Api.get_data.each do |hash|
    Game.create(id: hash["id"], slug: hash["slug"], name: hash["name"], background_image: hash["background_image"], rating: hash["rating"], platform: hash["platform"], genres: hash["genres"], clip: hash["clip"], )
end

