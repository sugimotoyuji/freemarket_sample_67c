class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user ,null:false ,foreign_key:true
      t.integer   :category_id,null:false 
      t.integer    :size_id, null:false 
      t.integer    :condition_id,null:false 
      t.integer    :delivery_charge_id,null:false 
      t.integer   :delivery_date_id,null:false 
      t.integer    :delivery_way_id,null:false 
      t.integer    :order_status_id, default: 1
      t.integer    :likes_count
      t.string :brand_id 
      t.string :name ,null:false
      t.integer :price, null:false
      t.text :description,null:false
      t.timestamps
    end
  end
end
