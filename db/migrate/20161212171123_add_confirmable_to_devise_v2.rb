class AddConfirmableToDeviseV2 < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :tempimage, :string
    
  end

  def down
    remove_columns :users, :tempimage
  end
end
