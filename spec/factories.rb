FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.words.join(" ") }
  end

  factory :video do
    category
    title { Faker::Lorem.words.join(" ").titleize }
    small_cover_url { "/images/#{%w(futurama south_park family_guy).sample}.jpg" }
  end
end
