class CreateBuyCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_credits do |t|
      t.date       :number,   null: false
      t.references :buy, null: false, foreign_key: true
      t.string     :type,   null: false
      t.date       :month,  null: false
      t.date       :year,   null: false
      t.string     :security, null: false
      t.timestamps
    end
  end
end
