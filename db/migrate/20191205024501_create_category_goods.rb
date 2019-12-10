class CreateCategoryGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :category_goods do |t|
      t.references  :category,      null: false, foreign_key: true
      t.references  :good,          null: false, foreign_key: true
      t.index [:category_id, :good_id], unique: true
      t.timestamps
    end
    
  end
end
