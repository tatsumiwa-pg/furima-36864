class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :items_name,        null: false
      t.text :items_info,          null: false
      t.integer :category_id,      null: false
      t.integer :items_status_id,  null: false
      t.integer :shipping_fee_id,  null: false
      t.integer :prefecture_id,    null: false
      t.integer :shipping_date_id, null: false
      t.integer :items_price,      null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
