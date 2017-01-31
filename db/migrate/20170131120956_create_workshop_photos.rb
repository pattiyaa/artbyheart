class CreateWorkshopPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :workshop_photos do |t|
      t.references :workshop, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
