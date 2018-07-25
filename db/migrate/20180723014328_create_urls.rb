class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :name
      t.string :url
      t.references :token_id

      t.timestamps
    end
  end
end
