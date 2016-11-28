require 'digest/sha1'
class PhotosController < ApplicationController 
 layout "modal"
 
  def index
     
    # redirect_to 'ckeditor/pictures' and return
  end

  def new
   
  end

  def create
    
  
  end
  def browse
  end
  protected
  def find_asset
    @picture = Ckeditor.picture_adapter.get!(params[:id])
  end

  def authorize_resource
    model = (@picture || Ckeditor.picture_model)
    @authorization_adapter.try(:authorize, params[:action], model)
  end

  

end