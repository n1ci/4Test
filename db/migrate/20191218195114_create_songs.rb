class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :album_id
      t.integer :position
      t.string :title
      t.integer :duration
      t.timestamps
    end
  end
end
