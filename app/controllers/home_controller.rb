class HomeController < ApplicationController 
	layout "homepage"
	def index

		@posts = Post.where(:isToplist => true).order(updated_at: :desc).limit(10)
		@posthighlight = Post.where(:isHighlight => true).order(updated_at: :desc).first()

	end
end