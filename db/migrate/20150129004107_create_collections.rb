class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.text :name
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :collections, [:user_id, :created_at]
    add_foreign_key :collections, :users
  end
end
