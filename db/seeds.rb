# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'cactuslovrr', password: '1234', role: 1)
User.create(username: 'ilovesucculents', password: '1234', role: 1)

# def seed_image(file_name)
#   x = File.open(File.join(Rails.root, "app/assets/images/#{file_name}.jpg"))
#   binding.pry
# end

gh1 = GreenHouse.create(name: 'Kellys House', location: 'Lakewood')
gh2 = GreenHouse.create(name: 'Greenhouse 1', location: 'Golden')
gh3 = GreenHouse.create(name: 'Greenhouse 2', location: 'Littleton')

gh1.plants.create(name: "Potato Cactus", variety: "OP030- Opuntia fragilis (debreczyi) v. denuda" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Opuntia_fragilis_debreczeyi_v._denuda_2_1400x.jpg?v=1486183886")
gh1.plants.create(name: "Prairie Beehive Cactus", variety: "CO001: Coryphantha vivipara" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/CO001_Coryphantha_vivipara_colorado_form_1400x.JPG?v=1485636432")
gh1.plants.create(name: "Opuntia Cactus", variety: "OT002: Maihueniopsis darwinii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Maihueniopsis_darwinii_1400x.JPG?v=1486190689")
gh1.plants.create(name: "Bruch's Chin Cactus", variety: "OT004: Gymnocalycium bruchii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/20180221132052_1400x.jpg?v=1520222671")
gh1.plants.create(name: "Torch Flower Aloe", variety: "OT007: Aloe aristata" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Agave_aristata_1400x.JPG?v=1509327235")

gh2.plants.create(name: "Hogan Succulent", variety: "OT019: Delosperma seaniihoganii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4/5', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/20180530_122949_1400x.jpg?v=1528827143")
gh2.plants.create(name: "Clam-shell Stone Plant", variety: "OT015 Aloinopsis spathulata" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/20180521_160633_1400x.jpg?v=1528785361")
gh2.plants.create(name: "Austrocactus", variety: "OT013: Austrocactus hibernus" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/20180516_100037_1400x.jpg?v=1528785144")
gh2.plants.create(name: "Patagonian opuntiad", variety: "OT003: Maihueniopsis poepigii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Maihueniopsis_poepigii_1400x.JPG?v=1486190768")
gh2.plants.create(name: "Deep Blue Form Agave", variety: "AG002: Agave parryi v. neomexicana x utahensis" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Agave_Deep_Blue_Form_4_1400x.JPG?v=1486253401")

gh3.plants.create(name: "Escobaria", variety: "ES001: Escobaria leei" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/ES002_1400x.JPG?v=1485637037")
gh3.plants.create(name: "Escobaria Misso", variety: "ES003: Escobaria missouriensis" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 2-10', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/20180411134336_1400x.jpg?v=1523805574")
gh3.plants.create(name: "Escobaria Sneedii", variety: "ES002: Escobaria sneedii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Escobaria_sneedii_2_1400x.JPG?v=1486017603")
gh3.plants.create(name: "Escobaria Villardii", variety: "ES006: Escobaria villardii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Escobaria_villardii_2_1400x.jpg?v=1536177898")
gh3.plants.create(name: "Escobaria Orcuttii", variety: "ES004: Escobaria orcuttii" , sell_quantity: 1, stock_plants: 1, zone: 'Zone 4', shipping: 'n/a', image: "https://cdn.shopify.com/s/files/1/1741/7323/products/Escobaria_orcuttii_1400x.JPG?v=1486017706")
