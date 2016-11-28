class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :avatarimg
      t.string :title
      t.integer :login

      t.timestamps
    end
  end
end
