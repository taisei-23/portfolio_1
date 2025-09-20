class RecreateUsersWithUuidAndOmniauth < ActiveRecord::Migration[8.0]
  def up
    remove_foreign_key :bookmarks, :users if foreign_key_exists?(:bookmarks, :users)
    remove_foreign_key :comments, :users if foreign_key_exists?(:comments, :users)
    remove_foreign_key :mountain_searches, :users if foreign_key_exists?(:mountain_searches, :users)
    remove_foreign_key :posts, :users if foreign_key_exists?(:posts, :users)
    
    remove_foreign_key :bookmarks, :posts if foreign_key_exists?(:bookmarks, :posts)

    drop_table :users if table_exists?(:users)
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :provider
      t.string :uid
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, [:provider, :uid], unique: true

    if table_exists?(:bookmarks)
      execute "TRUNCATE TABLE bookmarks CASCADE"
      change_column :bookmarks, :user_id, :uuid, using: 'gen_random_uuid()'
      add_foreign_key :bookmarks, :users
    end

    if table_exists?(:comments)
      execute "TRUNCATE TABLE comments CASCADE"
      change_column :comments, :user_id, :uuid, using: 'gen_random_uuid()'
      add_foreign_key :comments, :users
    end

    if table_exists?(:mountain_searches)
      execute "TRUNCATE TABLE mountain_searches CASCADE"
      change_column :mountain_searches, :user_id, :uuid, using: 'gen_random_uuid()'
      add_foreign_key :mountain_searches, :users
    end

    if table_exists?(:posts)
      execute "TRUNCATE TABLE posts CASCADE"
      change_column :posts, :user_id, :uuid, using: 'gen_random_uuid()'
      add_foreign_key :posts, :users
    end
    
    add_foreign_key :bookmarks, :posts if table_exists?(:bookmarks) && table_exists?(:posts)
  end

  def down
    remove_foreign_key :bookmarks, :users if foreign_key_exists?(:bookmarks, :users)
    remove_foreign_key :comments, :users if foreign_key_exists?(:comments, :users)
    remove_foreign_key :mountain_searches, :users if foreign_key_exists?(:mountain_searches, :users)
    remove_foreign_key :posts, :users if foreign_key_exists?(:posts, :users)
    remove_foreign_key :bookmarks, :posts if foreign_key_exists?(:bookmarks, :posts)
    
    if table_exists?(:bookmarks)
      execute "TRUNCATE TABLE bookmarks CASCADE"
      change_column :bookmarks, :user_id, :bigint
    end
    
    if table_exists?(:comments)
      execute "TRUNCATE TABLE comments CASCADE"
      change_column :comments, :user_id, :bigint
    end
    
    if table_exists?(:mountain_searches)
      execute "TRUNCATE TABLE mountain_searches CASCADE"
      change_column :mountain_searches, :user_id, :bigint
    end
    
    if table_exists?(:posts)
      execute "TRUNCATE TABLE posts CASCADE"
      change_column :posts, :user_id, :bigint
    end
    
    drop_table :users if table_exists?(:users)

    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false, default: ""
      t.string :provider
      t.string :uid
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, [:provider, :uid], unique: true
    
    add_foreign_key :bookmarks, :users if table_exists?(:bookmarks)
    add_foreign_key :comments, :users if table_exists?(:comments)
    add_foreign_key :mountain_searches, :users if table_exists?(:mountain_searches)
    add_foreign_key :posts, :users if table_exists?(:posts)
    add_foreign_key :bookmarks, :posts if table_exists?(:bookmarks) && table_exists?(:posts)
  end
end
