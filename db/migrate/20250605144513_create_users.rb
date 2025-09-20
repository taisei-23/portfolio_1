class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
