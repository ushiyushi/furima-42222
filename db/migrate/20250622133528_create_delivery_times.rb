class CreateDeliveryTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_times do |t|
      t.string   :name   , null: false
      t.timestamps
    end
  end
end
