class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :full_name
      t.string :phone
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
