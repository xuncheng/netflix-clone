class Video < ActiveRecord::Base
  belongs_to :category, required: true
  validates :title, :small_cover_url, presence: true
end
