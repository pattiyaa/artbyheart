class AddAuthorToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :author, foreign_key: true
  end
end
