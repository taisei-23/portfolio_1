class CreateMountains < ActiveRecord::Migration[8.0]
  def change
    create_table :mountains, id: :uuid do |t|
      t.string :place_id
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.float :rating
      t.integer :user_ratings_total

      t.timestamps
    end
  end
end
