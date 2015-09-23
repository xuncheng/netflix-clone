require "rails_helper"

RSpec.describe Video, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:small_cover_url) }

  describe "search_by_title" do
    let!(:futurama) { create(:video, title: "Futurama", created_at: 1.day.ago) }
    let!(:back_to_future) { create(:video, title: "Back to Future") }

    it "returns an empty array if there is no match" do
      expect(Video.search_by_title("Hello")).to eq([])
    end

    it "returns an array of one video for an exact match" do
      expect(Video.search_by_title("Futurama")).to eq([futurama])
    end

    it "returns an array of one video for a patial match" do
      expect(Video.search_by_title("utura")).to eq([futurama])
    end

    it "returns an array of all matches ordered by created_at" do
      expect(Video.search_by_title("utur")).to eq([back_to_future, futurama])
    end

    it "returns an empty array for a search with an empty string" do
      expect(Video.search_by_title("")).to eq([])
    end
  end
end
