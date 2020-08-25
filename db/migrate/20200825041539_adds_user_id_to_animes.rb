class AddsUserIdToAnimes < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :user_id, :integer
  end
end
