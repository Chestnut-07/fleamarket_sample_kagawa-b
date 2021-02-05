class RenameHoneNumberColumnToDestinations < ActiveRecord::Migration[6.0]
  def change
    rename_column :destinations, :@hone_number, :phone_number
  end
end
