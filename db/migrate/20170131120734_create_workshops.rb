class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.string :title
      t.string :description
      t.string :slung
      t.string :meta_description
      t.string :meta_keywords
      t.string :meta_title
      t.datetime :start
      t.datetime :finish
      t.integer :capacity
      t.references :author, foreign_key: true
      t.datetime :available_on
      t.datetime :discontinue_on
      t.references :category, foreign_key: true
      t.decimal :price
      t.decimal :cost

      t.timestamps
    end
  end
end
