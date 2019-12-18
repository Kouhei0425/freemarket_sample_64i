class RenameTypeColumnToCredits < ActiveRecord::Migration[5.0]
  def change
    rename_column :credits, :type, :company
  end
end
