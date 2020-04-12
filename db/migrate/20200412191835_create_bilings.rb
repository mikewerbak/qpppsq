class CreateBilings < ActiveRecord::Migration[6.0]
  def change
    create_table :bilings do |t|
      t.string :bill

      t.timestamps
    end
  end
end
