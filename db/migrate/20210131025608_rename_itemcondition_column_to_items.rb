class RenameItemconditionColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :item_condition, :condition_id
  end
end
