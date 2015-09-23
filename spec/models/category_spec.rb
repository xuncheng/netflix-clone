require "rails_helper"

RSpec.describe Category, type: :model do
  it { is_expected.to have_many(:videos) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  describe "#recent_videos" do
    let(:comedies) { create(:category, name: "Comedies") }

    it "returns videos in a descending order for created_at" do
      family_guy = create(:video, category: comedies, created_at: 1.day.ago)
      south_park = create(:video, category: comedies)
      expect(comedies.recent_videos).to eq([south_park, family_guy])
    end

    it "returns all videos if there are less than 6 videos" do
      family_guy = create(:video, category: comedies, created_at: 1.day.ago)
      south_park = create(:video, category: comedies)
      expect(comedies.recent_videos.size).to eq(2)
    end

    it "returns 6 videos if there are more than 6 videos" do
      7.times { create(:video, category: comedies) }
      expect(comedies.recent_videos.size).to eq(6)
    end

    it "returns the latest 6 videos" do
      family_guy = create(:video, category: comedies, created_at: 1.day.ago)
      6.times { create(:video, category: comedies) }
      expect(comedies.recent_videos).not_to include(family_guy)
    end

    it "returns an empty array if there are no videos" do
      expect(comedies.recent_videos).to eq([])
    end
  end
end
