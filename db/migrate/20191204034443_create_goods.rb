class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      
      t.string      :name,          null: false
      t.string      :size,          null: false
      t.integer     :price,         null: false
      t.text        :method,        null: false
      t.text        :ship,          null: false
      t.text        :status,        null: false
      t.text        :burden,        null: false
      t.text        :explain,       null: false
      t.references  :user,          null: false, foreign_key: true
      t.references  :brand,         null: false, foreign_key: true
      t.references  :area,          null: false, foreign_key: true
      t.timestamps
    end
  end
end

