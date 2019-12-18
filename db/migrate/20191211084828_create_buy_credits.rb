class CreateBuyCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_credits do |t|
      t.references :buy,         null: false, foreign_key: true
      t.string     :card_id,     null: false
      t.string     :customer_id, null: false
      t.timestamps
    end
  end
end
