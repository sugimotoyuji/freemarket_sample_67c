class CreateItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :item_images do |t|
      t.references :item,null:false, foreign_key:true
      t.text :image ,null:false
      t.timestamps
    end
  end
end
