class AddColumnsToAuthor < ActiveRecord::Migration[5.0]
  def self.up
    add_column :authors, :profile, :text
    add_column :authors, :subtitle, :string
  end
  def self.down
    remove_column :authors, :profile
    remove_column :authors, :subtitle
  end
end
