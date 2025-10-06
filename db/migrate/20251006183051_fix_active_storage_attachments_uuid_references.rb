class FixActiveStorageAttachmentsUuidReferences < ActiveRecord::Migration[8.0]
  def up
    puts "=== Active Storage Attachments UUID修正開始 ==="

    current_column = connection.columns(:active_storage_attachments)
                              .find { |c| c.name == 'record_id' }
    puts "現在のrecord_id型: #{current_column.type}"
    
    if current_column.type.in?([:integer, :bigint])
      puts "record_idをuuid型に変更中..."

      add_column :active_storage_attachments, :record_id_uuid, :uuid
      
      puts "=== 孤立したAttachmentレコードの処理 ==="

      orphan_count = ActiveStorage::Attachment.where(record_id: 0).count
      puts "孤立したAttachmentレコード数: #{orphan_count}"
      
      if orphan_count > 0
        puts "警告: 参照先が失われたAttachmentレコードを削除します"
        execute "DELETE FROM active_storage_attachments WHERE record_id = 0"

        execute <<-SQL
          DELETE FROM active_storage_blobs 
          WHERE id NOT IN (
            SELECT blob_id FROM active_storage_attachments
          )
        SQL
        puts "孤立したBlobレコードも削除しました"
      end

      remove_column :active_storage_attachments, :record_id
      rename_column :active_storage_attachments, :record_id_uuid, :record_id

      add_index :active_storage_attachments, [:record_type, :record_id], 
                name: "index_active_storage_attachments_on_record"
      
      puts "=== 変換完了 ==="
      puts "Active Storage Attachmentsのrecord_idをuuid型に変更しました"
      puts "孤立したレコードは削除されました"
      puts "新しいファイルアップロード時に正しい関連付けが行われます"
      
    else
      puts "record_idは既にuuid型です"
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end