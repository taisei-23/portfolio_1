class ConvertPostsIdToUuid < ActiveRecord::Migration[8.0]
  def up
    remove_foreign_key :bookmarks, :posts if foreign_key_exists?(:bookmarks, :posts)
    remove_foreign_key :comments, :posts if foreign_key_exists?(:comments, :posts)

    execute "TRUNCATE TABLE bookmarks CASCADE"
    execute "TRUNCATE TABLE comments CASCADE"
    execute "TRUNCATE TABLE posts CASCADE"

    remove_column :posts, :id
    add_column :posts, :id, :uuid, default: -> { "gen_random_uuid()" }, null: false
    execute "ALTER TABLE posts ADD PRIMARY KEY (id);"

    change_column :bookmarks, :post_id, :uuid, using: 'gen_random_uuid()'
    change_column :comments, :post_id, :uuid, using: 'gen_random_uuid()'

    add_foreign_key :bookmarks, :posts
    add_foreign_key :comments, :posts
  end

  def down
    remove_foreign_key :bookmarks, :posts if foreign_key_exists?(:bookmarks, :posts)
    remove_foreign_key :comments, :posts if foreign_key_exists?(:comments, :posts)

    execute "TRUNCATE TABLE bookmarks CASCADE"
    execute "TRUNCATE TABLE comments CASCADE"
    execute "TRUNCATE TABLE posts CASCADE"

    remove_column :posts, :id
    add_column :posts, :id, :bigint, null: false
    execute "ALTER TABLE posts ADD PRIMARY KEY (id);"
    execute "CREATE SEQUENCE IF NOT EXISTS posts_id_seq;"
    execute "ALTER SEQUENCE posts_id_seq RESTART WITH 1;"
    execute "ALTER TABLE posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq');"

    change_column :bookmarks, :post_id, :bigint
    change_column :comments, :post_id, :bigint

    add_foreign_key :bookmarks, :posts
    add_foreign_key :comments, :posts
  end
end
