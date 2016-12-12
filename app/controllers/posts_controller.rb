class PostsController < ApplicationController 
	def index
		if has_cat?
			@posts = Post.where( :post_category_id => cat,:isToplist => true, :active => true).where("published_date <  ?",Date.today).order(updated_at: :desc)
		else
			@posts =Post.where(:isToplist => true, :active => true).where("published_date <  ?",Date.today).order(updated_at: :desc)
		end 
	end
	def show
		set_post
		@topposts = Post.where(:active => true).where("published_date <  ? AND id != ?",Date.today,params[:id]).order(updated_at: :desc).limit(3)
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