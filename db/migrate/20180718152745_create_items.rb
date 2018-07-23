class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :max
      t.integer :current
      t.references :token, foreign_key: true

      t.timestamps
    end
  end
end
