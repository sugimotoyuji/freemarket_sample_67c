class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string     :shipping_first_name,         null: false
      t.string     :shipping_first_name_reading, null: false
      t.string     :shipping_last_name,          null: false
      t.string     :shipping_last_name_reading,  null: false
      t.string     :zip_code,                    null: false
      t.string     :prefecture,                  null: false
      t.string     :city,                        null: false
      t.string     :address,                     null: false
      t.string     :building
      t.string     :shipping_telephone
      t.references :user
      t.timestamps
    end
  end
end
