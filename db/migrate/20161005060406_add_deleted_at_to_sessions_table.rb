class AddDeletedAtToSessionsTable < ActiveRecord::Migration
  def change
    add_column :sessions, :deleted_at, :string
  end
end
