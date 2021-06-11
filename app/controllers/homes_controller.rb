class HomesController < ApplicationController

  def top
    @user_id = current_user
  end

  def about
    @user_id = current_user
  end

end
