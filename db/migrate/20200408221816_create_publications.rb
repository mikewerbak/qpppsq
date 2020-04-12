class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.string :publisher_type
      t.integer :publisher_id
      t.boolean :single_issue

      t.timestamps
    end
  end
end
