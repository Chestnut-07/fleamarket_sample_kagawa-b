class RenameShippingfeepayerColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_fee_payer, :shipping_fee_payer_id
  end
end
