class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token, index: true, null: false
      t.integer :ttl, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
