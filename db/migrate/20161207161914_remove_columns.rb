class RemoveColumns < ActiveRecord::Migration[5.0]
  def self.up
  	remove_column :authors, :avatarimg
  end
  def self.down
	  add_column :authors, :avatarimg, :string
  end
end
