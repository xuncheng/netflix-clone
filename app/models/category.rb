class Category < ActiveRecord::Base
  has_many :videos, -> { order(created_at: :desc) }, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def recent_videos
    videos.limit(6)
  end
end
