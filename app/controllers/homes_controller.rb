class HomesController < ApplicationController

  def top
    @user_id = current_user
  end

  def about
    @user_id = current_user
  end

  # def guest_sign_in
  #   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #     user.name = 'ゲストユーザー'
  #   end
  #   sign_in user
  #   redirect_to user_path(user.id), notice: 'ゲストユーザーとしてログインしました'
  # end
end
