class TherapistsController < ApplicationController 
	def show
		set_author
	end
	private
	def set_author
		@author = Author.find(params[:id])
	end
end