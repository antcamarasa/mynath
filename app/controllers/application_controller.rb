class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :remove_password_params_if_blank, only: :configure_permitted_parameters

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :encrypted_password,  :email, :weight, :height, :birthday_date, :phone_number, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :encrypted_password,  :email, :weight, :height, :birthday_date, :phone_number, :photo])
  end

  private

  # def remove_password_params_if_blank
  #   if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  #     params[:user].delete(:password)
  #     params[:user].delete(:password_confirmation)
  #   end
  # end
 end
