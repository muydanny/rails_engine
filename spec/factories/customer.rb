FactoryBot.define do
  factory :customer do
    first_name { Faker::TvShows::HeyArnold.character }
    last_name { Faker::Movies::StarWars.droid }
  end
end