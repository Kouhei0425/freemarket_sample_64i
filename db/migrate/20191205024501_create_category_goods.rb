class CreateCategoryGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :category_goods do |t|
      t.references  :category,      null: false, foreign_key: true
      t.references  :good,          null: false, foreign_key: true
      t.timestamps
    end
    add_index :category_id, :good_id,  unique: true
  end
end
