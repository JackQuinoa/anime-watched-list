class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :title 
      t.integer :rating 
      t.string :comments
      t.timestamps
  end
end
