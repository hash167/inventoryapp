class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.string :transaction_type
      t.date :assigned_on
      t.date :removed_on

      t.timestamps null: false
    end
  end
end
