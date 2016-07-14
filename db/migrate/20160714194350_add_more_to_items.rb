class AddMoreToItems < ActiveRecord::Migration
  def change
    add_column :items, :cost, :integer
    add_column :items, :serial, :string
  end
end
