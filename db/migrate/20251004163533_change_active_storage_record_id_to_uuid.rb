class ChangeActiveStorageRecordIdToUuid < ActiveRecord::Migration[8.0]
  def change
    change_column :active_storage_attachments, :record_id, :uuid, using: 'record_id::text::uuid'
  end
end
