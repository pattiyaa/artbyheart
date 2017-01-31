class CreatePostsAndTags < ActiveRecord::Migration[5.0]
  def self.up
     create_table :posts_tags, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
    end
    
  end
  def self.down
  		drop_table :posts_tags
  end
end
