class CreateAddressBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :address_books do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
