class AboutController < ApplicationController 
	layout "modal" , only: [:map]
	def map
		render template: "about/googlemap"
	end
end