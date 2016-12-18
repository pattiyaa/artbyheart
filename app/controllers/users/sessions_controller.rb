class Users::SessionsController < Devise::SessionsController
   layout "modal"
   clear_respond_to
    respond_to :json ,only: [:create]
    respond_to :html,only: [:new,:destroy]

# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
   #   super
    respond_to do |format|
      format.html {

        super
      }
      format.json {
        resource = User.find_for_database_authentication(:email=>params[:email])
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:password])
          sign_in("user", resource)
          render :json=> {:success=>true}
          return
        end
        invalid_login_attempt

      }
    end
    end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :msg=>t('msg.login_err')}, :status=>401
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
