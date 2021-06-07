class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top, :about, :guest_sign_in]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user.id)
  end

  def after_sign_up_path_for(resource)
    user_path(@user.id)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
    sign_in user
    redirect_to user_path(user.id), notice: 'ゲストとしてログインしました'
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :email])
  end

end
