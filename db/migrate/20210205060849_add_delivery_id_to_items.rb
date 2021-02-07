class AddDeliveryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delivery_id, :string, null: false, after: :shipping_fee_payer_id
  end
end