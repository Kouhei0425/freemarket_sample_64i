class CreateBuyAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_addresses do |t|
      t.string   :post,       null: false
      t.string   :prefecture, null: false
      t.string   :city,       null: false
      t.string   :address,    null: false
      t.string   :buil      
      t.references :buy,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
