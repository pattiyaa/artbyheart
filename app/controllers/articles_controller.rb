class ArticlesController < ApplicationController 
	def index
		cat = 1;
		@posts = Post.where( :post_category_id => cat,:isToplist => true, :active => true).where("published_date <  ?",Date.today).order(updated_at: :desc)
		render template: "posts/index"
	end
end