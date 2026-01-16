class ConvertActiveStorageAttachmentsRecordIdToUuid < ActiveRecord::Migration[8.0]
  def up
    return if column_exists?(:active_storage_attachments, :record_id, :uuid)

    add_column :active_storage_attachments, :record_id_tmp, :uuid

    execute <<-SQL
      UPDATE active_storage_attachments a
      SET record_id_tmp = u.id
      FROM users u
      WHERE a.record_type = 'User' AND a.record_id = u.id::bigint
    SQL

    remove_column :active_storage_attachments, :record_id
    rename_column :active_storage_attachments, :record_id_tmp, :record_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
