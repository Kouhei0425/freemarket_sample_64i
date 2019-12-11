class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string     :post,    null: false
      t.string     :prefecture, null: false
      t.string     :city,       null: false
      t.string     :address,    null: false
      t.string     :buil,       null: false, unique: true
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
