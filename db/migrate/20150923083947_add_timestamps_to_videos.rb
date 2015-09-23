class AddTimestampsToVideos < ActiveRecord::Migration
  def change
    add_timestamps :videos
    add_index :videos, :created_at
  end
end
