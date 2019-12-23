class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_kana,        null: false
      t.string :first_kana,         null: false
      t.string     :post,    null: false
      t.string     :prefecture, null: false
      t.string     :city,       null: false
      t.string     :address,    null: false
      t.string     :buil,       null: false, unique: true
      t.references :user,    null: false, foreign_key: true
      t.string :phone_number,       null: false, unique: true
      t.timestamps
    end
  end
end
