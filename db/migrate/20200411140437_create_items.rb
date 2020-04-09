class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user ,null:false ,foreign_key:true
      t.references :category,null:false ,foreign_key:true
      t.references :brand,null:false,foreign_key:true
      t.references :size,null:false,foreign_key:true
      t.references :condition,foreign_key:true
      t.references :delivery_charge,foreign_key:true
      t.references :delivery_date,foreign_key: true
      t.references :delivery_way,foreign_key: true
      t.references :order_status,foreign_key: true
      t.string :name ,null:false
      t.integer :price, null:false
      t.text :description,null:false
      t.timestamps
    end
  end
end
