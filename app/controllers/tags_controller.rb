class TagsController < InheritedResources::Base
  layout "modal"
  def create
  	  
  	  debugger
  	  tag_create
  	  if has_redirect?
  	  	redirect_to params[:redirectturl] and return
  	  end
  end
  private

    def tag_params
      params.require(:tag).permit(:name)
    end
    def has_redirect?
    	params[:redirectturl].present?
    end
end

