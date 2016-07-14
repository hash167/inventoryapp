class AddMoreitemsToItems < ActiveRecord::Migration
  def change
    add_column :items, :equipment_type, :string
    add_column :items, :model_number, :string
  end
end
