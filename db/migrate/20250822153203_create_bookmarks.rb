class CreateBookmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :bookmarks, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :post, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :bookmarks, [ :user_id, :post_id ], unique: true
  end
end
