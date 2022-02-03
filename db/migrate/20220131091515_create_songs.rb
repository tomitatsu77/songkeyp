class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      
      t.string :song_name, null: false
      t.string :artist
      t.text :memo
      t.integer :eval
      t.integer :key,default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end
