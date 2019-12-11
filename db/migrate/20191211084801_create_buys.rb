class CreateBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :buys do |t|
      t.references :good,  null: false, unique: true, foreign_key: true
      t.references :user,  null: false, foreign_key: true
      t.integer    :price,    null: false
      t.timestamps
    end
  end
end
