class CreateBuyCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_credits do |t|
      t.integer       :number,   null: false
      t.references :buy, null: false, foreign_key: true
      t.string     :type,   null: false
      t.integer    :month,  null: false
      t.integer       :year,   null: false
      t.string     :security, null: false
      t.timestamps
    end
  end
end
