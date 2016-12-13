class Users::SessionsController < Devise::SessionsController
   layout "modal"
  #  def create
    
  #   super
    
  #   # resource = warden.authenticate!(:scope => resource_name, :recall => 'Users::Sessions#failure')
  #   # sign_in_and_redirect(resource_name, resource)
  # end

  # def sign_in_and_redirect(resource_or_scope, resource=nil)
  #   debugger
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   resource ||= resource_or_scope
  #   sign_in(scope, resource) unless warden.user(scope) == resource
  #   return render :json => {:success => true}
  # end

  # def failure
  #   return render :json => {:success => false, :errors => ["Login failed."]}
  # end
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
