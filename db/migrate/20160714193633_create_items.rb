class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :model
      t.text :description
      t.date :purchase_date

      t.timestamps null: false
    end
  end
end
