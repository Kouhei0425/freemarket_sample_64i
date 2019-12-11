class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.date     :number,    null: false
      t.string   :type,      null: false
      t.date     :month,     null: false
      t.date     :year,      null: false
      t.string   :security,  null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
