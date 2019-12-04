class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|　　　
      t.string :name
      t.references :parent, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
