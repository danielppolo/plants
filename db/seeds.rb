require 'faker'

Garden.destroy_all if Rails.env.development?
Label.destroy_all if Rails.env.development?

little = Garden.create!(
  name: 'My Little Garden',
  banner_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg'
)

other = Garden.create!(
  name: 'My Other Garden',
  banner_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg'
)

Plant::CATEGORIES.each do |category|
  Label.create!(name: category)
end

100.times do
  plant_instance = Plant.create!(
    name: Faker::TvShows::RickAndMorty.character,
    garden: Garden.all.sample, # Garden Instance
    image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg'
  )

  PlantLabel.create!(
    label: Label.all.sample,
    plant: plant_instance
  )
end
