class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id,      null: false, foreign_key: true
      t.integer :item_id,      null: false, foreign_key: true
      t.text :text,            null: false
      t.timestamps
    end
    add_index :comments, [:user_id, :item_id]
  end
end