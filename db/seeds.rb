# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

pizza_hut = Restaurant.create(:name => 'Pizza Hut')
pizza_hut.reviews.create(rating: 1, review: 'Really bad')
pizza_hut.reviews.create(rating: 2, review: "It's ok")
pizza_hut.reviews.create(rating: 3, review: 'I quite like it, but Pizza Express is better')
pizza_hut.reviews.create(rating: 4, review: 'Love this place')
pizza_hut.reviews.create(rating: 5, review: 'Amazeballs!')

nandos = Restaurant.create(:name => 'Nandos')
nandos.reviews.create(rating: 1, review: 'I puked')
nandos.reviews.create(rating: 2, review: 'The chips were ok')
nandos.reviews.create(rating: 3, review: 'It beats KFC')
nandos.reviews.create(rating: 4, review: 'I love chicken')
nandos.reviews.create(rating: 5, review: 'Spicy chickeny goodness')
