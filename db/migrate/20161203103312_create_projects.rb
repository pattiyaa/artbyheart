class CreateProjects < ActiveRecord::Migration[5.0]
  def self.up
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
    create_table :ckeditor_assets_projects, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :picture, index: true,:class_name => "Ckeditor::Picture"
  	end
  end
  def self.down
  		drop_table :projects
  		drop_table :ckeditor_assets_projects
  end
end
