# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
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
  
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def after_sign_in_path_for(resource)
      user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  
    def reject_user
      @user = User.find_by(email: params[:user][:email])
      if @user 
        if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
          redirect_to new_user_registration
        else
          flash[:notice] = "項目を入力してください"
        end
      end
    end
end
