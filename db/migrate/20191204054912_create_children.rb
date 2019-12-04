class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|

      t.references :category, foreign_key: { to_table: :categories }
      t.references :child, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
