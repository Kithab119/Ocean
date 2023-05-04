# frozen_string_literal: true

class Creator::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]
  before_action :creator_state, only: [:create]

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


protected
  def creator_state
    @creator = Creator.find_by(email: params[:creator][:email])
    return if !@creator
    if @creator.valid_password?(params[:creator][:password])
      if @creator.is_deleted == true
        redirect_to new_creator_registration_path
      end
    end
  end

end
