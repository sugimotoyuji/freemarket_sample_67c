class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer    :zip_code,   null: false
      t.integer    :prefecture, null: false
      t.string     :city,       null: false
      t.string     :address,    null: false
      t.string     :building
      t.references :user
      t.timestamps
    end
  end
end
