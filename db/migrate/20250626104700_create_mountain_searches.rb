class CreateMountainSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :mountain_searches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mountain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
