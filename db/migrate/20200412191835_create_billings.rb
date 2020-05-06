class CreateBillings < ActiveRecord::Migration[6.0]
  def change
    create_table :billings do |t|
      t.string :bill
      t.references :account
      t.references :bank

      t.timestamps
    end
  end
end
