class CreateProfits < ActiveRecord::Migration[5.0]
  def change
    create_table :profits do |t|
      t.integer :profit
      t.references :user,foreign_key: true
      t.references  :item, foreign_key: true
      t.datetime :expiration_date
      t.boolean :profit_is_vaild
      t.timestamps
    end
  end
end
