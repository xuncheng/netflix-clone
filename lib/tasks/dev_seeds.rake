if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      dramas = create(:category, name: "TV Dramas")
      reality = create(:category, name: "Reality TV")
      commendies = create(:category, name: "TV Commedies")

      create(
        :video,
        category: dramas, title: "Futurama",
        description: "Space travel!",
        small_cover_url: "/images/futurama.jpg"
      )
      create(
        :video, category: dramas, title: "Monk",
        description: "Paranoid SF detective",
        small_cover_url: "/images/monk.jpg",
        large_cover_url: "/images/monk_large.jpg"
      )
      create(
        :video, category: reality, title: "South Park",
        description: "Hippie kides",
        small_cover_url: "/images/south_park.jpg"
      )
      create(
        :video, category: commendies, title: "Family Guy",
        description: "Peter griffin and talking dog",
        small_cover_url: "/images/family_guy.jpg"
      )

    end
  end
end
