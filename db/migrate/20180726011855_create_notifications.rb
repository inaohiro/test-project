class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :notification_token
      t.references :token, foreign_key: true

      t.timestamps
    end
  end
end
