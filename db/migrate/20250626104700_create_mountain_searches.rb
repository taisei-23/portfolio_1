class CreateMountainSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :mountain_searches, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :mountain, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
