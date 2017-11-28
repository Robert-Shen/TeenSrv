class Users::RegistrationsController < Devise::RegistrationsController

# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    @user = User.find(current_user.id)
    @user.username = params[:user][:email]
    @user.usertype = params[:user][:usertype]
    @user.save

    if @user.usertype == 0
      @teenager = Teenager.new
      @teenager.user_id = @user.id
      @teenager.save(validate: false)
    elsif @user.usertype == 1
      @client = Client.new
      @client.user_id = @user.id
      @client.save(validate: false)
    end

  end

  # GET /resource/edit
  def edit
    #@user = User.find(current_user.id)
    #@profile = Profile.find_by!(user_id: current_user.id)
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    lsdflakjsdf
    super

  end


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.

  def after_sign_up_path_for(user)
    return user_path(user)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end