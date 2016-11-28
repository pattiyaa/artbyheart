class Admin::TagsController < InheritedResources::Base
  layout "modal"
  def create
  	debugger
  	 create_tag
  	 
  	 if has_redirect?
  	 	redirect_to params[:redirectturl] and return
  	 end

  end
  private

    def tag_params
      params.require(:tag).permit()
    end
    def has_redirect?
    	params[:redirectturl].present?
    end
end

