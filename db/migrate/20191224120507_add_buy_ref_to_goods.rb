class AddBuyRefToGoods < ActiveRecord::Migration[5.0]
  def change
    add_reference :goods, :buy, foreign_key: true, null: true
  end
end
