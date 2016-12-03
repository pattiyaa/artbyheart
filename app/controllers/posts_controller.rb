class PostsController < ApplicationController 
	def index
		
		if has_cat?
			@posts = Post.where( :post_category_id => cat)

		else
			@posts =Post.all
		end 
	end
	def show
		set_post
	end
	private
	def set_post
		@post = Post.find(params[:id])
	end
	def cat
		params[:cat]
	end
	def has_cat?
		params[:cat].present?
	end
end