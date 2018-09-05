# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'cactuslover1', password: '1234', role: 1)

# def seed_image(file_name)
#   x = File.open(File.join(Rails.root, "app/assets/images/#{file_name}.jpg"))
#   binding.pry
# end

gh1 = GreenHouse.create(name: 'Kellys House', location: 'Lakewood')
gh2 = GreenHouse.create(name: 'Greenhouse 1', location: 'Golden')
gh3 = GreenHouse.create(name: 'Greenhouse 2', location: 'Littleton')

gh1.plants.create(name: "OP030- Opuntia fragilis (debreczyi) v. denuda", variety: "Potato Cactus", sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Opuntia_fragilis_debreczeyi_v._denuda_2_1400x.jpg?v=1486183886")
