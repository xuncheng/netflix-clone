class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :category, index: true
      t.string :title, null: false
      t.text :description
      t.string :small_cover_url, null: false
      t.string :large_cover_url
      t.timestamp null: false
    end
    add_index :videos, :title
  end
end
