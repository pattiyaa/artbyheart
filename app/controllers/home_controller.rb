class HomeController < ApplicationController 
	layout "homepage"
	def index
		@posts = Post.where(:isToplist => true, :active => true).where("published_date <  ?",Date.today).order(updated_at: :desc).limit(10)
		@posthighlight = Post.where(:isHighlight => true).order(updated_at: :desc).first()
		@authors = Author.all.order(updated_at: :desc);
	end
end