class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer     :number,    null: false
      t.string   :type,      null: false
      t.integer     :month,     null: false
      t.integer     :year,      null: false
      t.string   :security,  null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
