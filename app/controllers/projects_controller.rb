class ProjectsController < ApplicationController 
	layout "modal"
	def show
		set_project
	end
	private
	def set_project
		@project = Project.find(params[:id])
	end
end