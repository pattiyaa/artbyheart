class CreatePosts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.string :cover_img
      t.belongs_to :post_category, index: true
      t.text :content
      t.boolean :active 
      t.belongs_to :author , index: true
      t.boolean  :isHighlight
      t.boolean  :isToplist
      t.datetime :published_date
      t.timestamps
    end
     create_table :post_categories do |t|
     	t.string :name
     	t.timestamps
     end
     create_table :tags do |t|
     	t.belongs_to :posts, index: true
     	t.string :name
     	t.timestamps
     end
  end

  def self.down
    drop_table :posts
    drop_table :post_category
    drop_table :tags
  end
end
