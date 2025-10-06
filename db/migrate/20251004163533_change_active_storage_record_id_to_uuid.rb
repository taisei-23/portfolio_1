class ChangeActiveStorageRecordIdToUuid < ActiveRecord::Migration[8.0]
  def up
    return unless extension_enabled?("pgcrypto")
    
    puts "Active Storage データの確認..."
    puts "Attachments: #{ActiveStorage::Attachment.count}"
    puts "Blobs: #{ActiveStorage::Blob.count}"
    puts "VariantRecords: #{ActiveStorage::VariantRecord.count}"

    puts "VariantRecords を削除中..."
    ActiveStorage::VariantRecord.delete_all
    puts "VariantRecords を削除しました"

    puts "既存のActive Storageデータを削除中..."
    ActiveStorage::Attachment.delete_all
    ActiveStorage::Blob.delete_all
    puts "既存のActive Storageデータを削除しました"
  end
  
  def down
    recreate_active_storage_with_integer
  end
  
  private
  
  def recreate_active_storage_with_uuid
    drop_table :active_storage_variant_records if table_exists?(:active_storage_variant_records)
    drop_table :active_storage_attachments if table_exists?(:active_storage_attachments)
    drop_table :active_storage_blobs if table_exists?(:active_storage_blobs)

    create_table :active_storage_blobs, id: :uuid do |t|
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum
      t.datetime :created_at,   null: false
      
      t.index [ :key ], unique: true
    end
    
    create_table :active_storage_attachments, id: :uuid do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false, type: :uuid
      t.references :blob,     null: false, type: :uuid
      t.datetime   :created_at, null: false
      
      t.index [ :record_type, :record_id, :name, :blob_id ], 
              name: :index_active_storage_attachments_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
    
    create_table :active_storage_variant_records, id: :uuid do |t|
      t.references :blob, null: false, index: false, type: :uuid
      t.string :variation_digest, null: false
      t.datetime :created_at, null: false
      
      t.index [:blob_id, :variation_digest], 
              name: :index_active_storage_variant_records_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
  
  def recreate_active_storage_with_integer
    drop_table :active_storage_variant_records if table_exists?(:active_storage_variant_records)
    drop_table :active_storage_attachments if table_exists?(:active_storage_attachments)
    drop_table :active_storage_blobs if table_exists?(:active_storage_blobs)

    create_table :active_storage_blobs, id: :primary_key do |t|
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum
      t.datetime :created_at,   null: false
      
      t.index [ :key ], unique: true
    end
    
    create_table :active_storage_attachments, id: :primary_key do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false
      t.datetime   :created_at, null: false
      
      t.index [ :record_type, :record_id, :name, :blob_id ], 
              name: :index_active_storage_attachments_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
    
    create_table :active_storage_variant_records, id: :primary_key do |t|
      t.references :blob, null: false, index: false
      t.string :variation_digest, null: false
      t.datetime :created_at, null: false
      
      t.index [:blob_id, :variation_digest], 
              name: :index_active_storage_variant_records_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end
